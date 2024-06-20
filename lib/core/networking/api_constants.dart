class ApiConstants {
  static const String apiBaseUrl = "https://www.roaiaofficial.somee.com/api";

  static const String login = "$apiBaseUrl/Auth/login";
  static const String register = "$apiBaseUrl/Auth/register";
  static const String sendOtp = "$apiBaseUrl/Auth/SendOTPCode";
  static const String otbVerification = "$apiBaseUrl/Auth/otbVerification";
  static const String resetPass = "$apiBaseUrl/Auth/resetPassword";
  static const String changePassword = "$apiBaseUrl/Auth/changePassword";
  static const String userInfo = "$apiBaseUrl/Account/userinfo";
  static const String blindInfo = "$apiBaseUrl/Account/blindinfo";
  static const String refreshToken = "$apiBaseUrl/Auth/refreshToken";
  static const String editProfile = "$apiBaseUrl/Auth/modifyUser";
}
