bool validateEmailAddress(String email) {
  const emailRegex = "[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";

  if (RegExp(emailRegex).hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}

bool validatePassword(String password) {
  if (password.length < 6) {
    return false;
  } else {
    return true;
  }
}