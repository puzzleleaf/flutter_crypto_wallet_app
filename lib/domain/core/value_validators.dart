
bool validateEmailAddress(String email) {
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

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