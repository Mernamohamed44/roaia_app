import 'package:flutter/material.dart';
import 'package:roaia_app/models/login_response.dart';

class UserProvider with ChangeNotifier {
  late LoginResponse _user;

  LoginResponse get user => _user;

  void setUser(LoginResponse user) {
    _user = user;
    notifyListeners();
  }
}
