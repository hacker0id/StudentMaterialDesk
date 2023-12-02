bool isValidEmail(String email) {
  // Regular expression for a simple email validation
  final RegExp emailRegExp =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegExp.hasMatch(email);
}

bool isValidPhoneNumber(String phoneNumber) {
  // Regular expression for a valid Indian phone number
  // Assumes a 10-digit number starting with 6, 7, 8, or 9
  final RegExp phoneRegExp = RegExp(r'^[6789]\d{9}$');
  return phoneRegExp.hasMatch(phoneNumber);
}
