class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return "Enter your email";
    if (!value.contains('@')) return "Enter a valid email";
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.length < 6) return "Password must be at least 6 characters";
    return null;
  }
}
