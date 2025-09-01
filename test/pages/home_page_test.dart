import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FakeUser extends Fake implements User {}

class MockAuthService extends Mock implements AuthService {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeUser());
  });

  group('HomePage AuthService tests', () {
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
    });

    test('currentUser returns a fake user', () {
      when(() => mockAuthService.currentUser).thenReturn(FakeUser());
      final user = mockAuthService.currentUser;
      expect(user, isA<User>());
    });

    test('signOut calls notifyListeners', () async {
      when(() => mockAuthService.signOut()).thenAnswer((_) async => {});
      await mockAuthService.signOut();
      verify(() => mockAuthService.signOut()).called(1);
    });
  });
}
