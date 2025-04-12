import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    // You can add real authentication here
    debugPrint('Logged in with $email / $password');
  }
}
