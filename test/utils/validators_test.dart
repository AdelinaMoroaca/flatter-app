import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/utils/validators.dart';

void main() {
  group("Email Validator", () {
    test("Empty email returns error", () {
      expect(Validators.emailValidator(""), "Enter your email");
    });

    test("Invalid email returns error", () {
      expect(Validators.emailValidator("invalidEmail"), "Enter a valid email");
    });

    test("Valid email returns null", () {
      expect(Validators.emailValidator("test@email.com"), null);
    });
  });

  group("Password Validator", () {
    test("Short password returns error", () {
      expect(Validators.passwordValidator("123"), "Password must be at least 6 characters");
    });

    test("Valid password returns null", () {
      expect(Validators.passwordValidator("123456"), null);
    });
  });
}
