import 'dart:io';

// ignore: constant_identifier_names
enum AuthMode { SIGNUP, LOGIN }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;
  AuthMode _mode = AuthMode.LOGIN;

  bool get isLogin => _mode == AuthMode.LOGIN;

  bool get isSignUp => _mode == AuthMode.SIGNUP;

  void toggleAuthMode() {
    _mode = isLogin ? AuthMode.SIGNUP : AuthMode.LOGIN;
  }
}
