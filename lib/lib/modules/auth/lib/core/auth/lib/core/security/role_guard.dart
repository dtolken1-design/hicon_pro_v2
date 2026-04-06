import '../auth/pin_auth_service.dart';

class RoleGuard {
  static bool isAdmin() {
    return AuthService.role == "admin";
  }

  static bool isTech() {
    return AuthService.role == "tech";
  }

  static bool isLoggedIn() {
    return AuthService.role != null;
  }
}
