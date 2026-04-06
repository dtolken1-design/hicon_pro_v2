class AuthService {
  static const adminPin = "1234"; // Danie
  static const techPin = "5678";  // Steven

  static String? role;

  static bool login(String pin) {
    if (pin == adminPin) {
      role = "admin";
      return true;
    }

    if (pin == techPin) {
      role = "tech";
      return true;
    }

    return false;
  }
}
