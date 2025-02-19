import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier {
  String name = '';
  String userName = '';

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setUserName(String userName) {
    this.userName = userName;
    notifyListeners();
  }
}
