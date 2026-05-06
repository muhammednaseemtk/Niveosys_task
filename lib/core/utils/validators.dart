class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter email";
    }

    if (!value.contains("@")) {
      return "Invalid email";
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter password";
    }

    if (value.length < 6) {
      return "Minimum 6 characters";
    }

    return null;
  }
}
