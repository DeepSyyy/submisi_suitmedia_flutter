import 'package:flutter/material.dart';

class TextFieldPalindrome extends StatelessWidget {
  const TextFieldPalindrome({super.key, required this.controllerPalindrome});
  final TextEditingController controllerPalindrome;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerPalindrome,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        labelText: 'Palindrome',
      ),
    );
  }
}
