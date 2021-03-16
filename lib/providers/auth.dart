// SPLASH PROVIDER
import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  bool _isLoggedIn = false;
  String _authPath = 'login';

  String _inputEmail = '';
  String _inputPassword = '';

  String getAuthPath() => _authPath;
  bool getIsLoggedIn() => _isLoggedIn;
  String getInputEmail() => _inputEmail;
  String getInputPassword() => _inputPassword;

  void changeAuthPath(String path) {
    _authPath = path; 
    notifyListeners();
  }
}
