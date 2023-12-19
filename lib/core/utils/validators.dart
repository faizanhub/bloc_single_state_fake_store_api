String? validateEmailField(String? email, {context}) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)'
      r'|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])'
      r'|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regex = RegExp(pattern);
  if (email == null || email.isEmpty) {
    return 'Email is empty';
  } else if (!regex.hasMatch(email)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePasswordField(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is empty';
  } else if (password.length < 6) {
    return 'Password should be at least 6 characters long';
  }
  return null;
}

String? validateNormalField(String? text) {
  if (text == null || text.isEmpty) {
    return 'This field is required';
  }
  return null;
}

String? validateNameField(String? text) {
  if (text == null || text.isEmpty) {
    return 'Name is empty';
  }
  return null;
}

String? validateLoginPasswordField(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is empty';
  }
  return null;
}
