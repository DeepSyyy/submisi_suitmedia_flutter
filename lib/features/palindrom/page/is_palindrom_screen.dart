import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_submission/features/palindrom/provider/palindrom_provider.dart';
import 'package:suitmedia_test_submission/features/palindrom/widgets/alert_dialog.dart';
import 'package:suitmedia_test_submission/features/palindrom/widgets/name_text_field.dart';
import 'package:suitmedia_test_submission/features/palindrom/widgets/palindrom_text_field.dart';
import 'package:suitmedia_test_submission/features/palindrom/widgets/submit_button.dart';
import 'package:suitmedia_test_submission/features/welcome/provider/welcome_provider.dart';
import 'package:suitmedia_test_submission/features/welcome/welcome_screen.dart';

class PalindromScreen extends StatelessWidget {
  PalindromScreen({super.key});

  final String name = "";

  final TextEditingController controllerPalindrome = TextEditingController();

  final TextEditingController controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _buildBodyPalindrom(context)));
  }

  _buildBodyPalindrom(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background_first_page.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(),
              const SizedBox(height: 52),
              TextFieldName(controllerName: controllerName),
              const SizedBox(height: 15),
              TextFieldPalindrome(controllerPalindrome: controllerPalindrome),
              const SizedBox(height: 45),
              Consumer<PalindromProvider>(
                builder: (context, state, _) {
                  return SubmitButton(
                    name: "CHECK",
                    onSubmit: () {
                      var check = state.checkPalindrome(
                        palindromeParams: controllerPalindrome.text,
                      );
                      if (check == true) {
                        showDialog(
                          context: context,
                          builder:
                              (context) => const SuitmediaAlertDialog(
                                isPalindrome: "This is a palindrome",
                              ),
                        );
                      } else if (check == false) {
                        showDialog(
                          context: context,
                          builder:
                              (context) => const SuitmediaAlertDialog(
                                isPalindrome: "This is not a palindrome",
                              ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder:
                              (context) => const SuitmediaAlertDialog(
                                isPalindrome: "Please input palindrome",
                              ),
                        );
                      }
                      controllerPalindrome.clear();
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              SubmitButton(
                name: "NEXT",
                onSubmit: () {
                  Provider.of<WelcomeProvider>(
                    context,
                    listen: false,
                  ).setName(controllerName.text);
                  Navigator.pushNamed(
                    context,
                    '/welcome',
                    arguments: WelcomeScreen(name: controllerName.text),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
