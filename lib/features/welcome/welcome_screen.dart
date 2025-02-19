import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_submission/features/palindrom/widgets/submit_button.dart';
import 'package:suitmedia_test_submission/features/welcome/provider/welcome_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.name});

  final String name;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<WelcomeProvider>(context).userName;
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Second Screen'))),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                userName != ''
                    ? 'Hello $userName'
                    : 'You have not entered your name yet',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: SubmitButton(
                name: 'Choose a User',
                onSubmit: () {
                  Navigator.pushNamed(context, '/third_page');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
