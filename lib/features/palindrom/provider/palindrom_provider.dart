import 'package:flutter/material.dart';

class PalindromProvider extends ChangeNotifier {
  bool checkPalindrome({required String palindromeParams}) {
    var palindrome = palindromeParams;
    if (palindrome == palindrome.split('').reversed.join()) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
}
