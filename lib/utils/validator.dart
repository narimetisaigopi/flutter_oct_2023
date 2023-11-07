class Validator {
  String? usernameValidator(String value) {
    if (value.isEmpty || value.length < 8) {
      return "Enter valid username";
    } else if (value.contains("!") || value.contains("#")) {
      return "should not contain special characters.";
    }
    return null;
  }

 String? validEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return "Enter valid email";
    }
    return null;
  }
}
