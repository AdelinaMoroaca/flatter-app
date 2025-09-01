import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/services/auth_service.dart';

void main() {
  group('AuthService Tests', () {
    late MockFirebaseAuth mockAuth;
    late AuthService authService;

    setUp(() {
      final mockUser = MockUser(
        isAnonymous: false,
        email: 'test@example.com',
        uid: '12345',
      );

      mockAuth = MockFirebaseAuth(mockUser: mockUser);
      authService = AuthService(firebaseAuth: mockAuth);
    });

    test('signIn creates a user', () async {
      final user = await authService.signIn('test@example.com', 'password123');
      expect(user, isA<User>());
      expect(user?.email, 'test@example.com');
    });

    test('signOut logs out the user', () async {
      await authService.signIn('test@example.com', 'password123');
      await authService.signOut();
      expect(mockAuth.currentUser, isNull);
    });

    test(
      'signIn with wrong password throws FirebaseAuthException (not supported by mocks)',
      () async {
         expect(true, true);
      },
      skip: true,
    );
  });
}
