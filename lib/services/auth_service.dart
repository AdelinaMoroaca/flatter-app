import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth;

  AuthService({FirebaseAuth? firebaseAuth})
      : _auth = firebaseAuth ?? FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User?> signUp(String email, String password, {String? name}) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (name != null && userCredential.user != null) {
      await userCredential.user!.updateDisplayName(name);
    }
    notifyListeners();
    return userCredential.user;
  }

  Future<User?> signIn(String email, String password) async {
    final userCredential =
        await _auth.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}
