import 'dart:math';

String createPassword({
  required double length,
  required bool includeUppercase,
  required bool includeLowercase,
  required bool includeNumbers,
  required bool includeSymbols,
}) {
  String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  String numericChars = '0123456789';
  String symbolChars = '!@#%^&*()-_=+{}[]|;:,.<>?';

  String chars = '';

  if (includeUppercase) chars += uppercaseChars;
  if (includeLowercase) chars += lowercaseChars;
  if (includeNumbers) chars += numericChars;
  if (includeSymbols) chars += symbolChars;

  if (chars.isEmpty) {
    return '';
  }

  Random random = Random();

  String password = '';

  for (var i = 0; i < length; i++) {
    int randomI = random.nextInt(chars.length);
    password += chars[randomI];
  }

  return password;
}