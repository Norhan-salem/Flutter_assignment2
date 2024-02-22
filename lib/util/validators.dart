class Validators {
  static String? checkLengthValidator(String? input, int minCharacters) {
    if (input == null) {
      return 'Input not found.';
    }
    if (input.length <= minCharacters) {
      return 'Input cannot be less than $minCharacters characters';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null) {
      return 'Email not found.';
    }
    // Regex for email validation
    String emailRegex = r'^[^@]+@[^@]+\.[^@]+$';
    if (!RegExp(emailRegex).hasMatch(email)) {
      return 'Invalid email format.';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null) {
      return 'Password not found.';
    }
    // Regex for password to be at least 8 char, 1 capital letter, 1 number, 1 special character
    String passwordRegex = r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';

    if (!RegExp(passwordRegex).hasMatch(password)) {
      return 'Password must be at least 8 characters, and include at least one capital letter, one special character and one number.';
    }
    return null;
  }

  static String? confirmPasswordValidator(String? password, String? confirmPassword) {
    if (confirmPassword == null) {
      return 'password confirmation not found.';
    }
    if (password != confirmPassword) {
      return 'Your passwords do not match.';
    }
    return null;
  }
}

