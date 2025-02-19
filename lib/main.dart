import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_submission/features/palindrom/page/is_palindrom_screen.dart';
import 'package:suitmedia_test_submission/features/palindrom/provider/palindrom_provider.dart';
import 'package:suitmedia_test_submission/features/user_list/presentation/provider/third_screen_provider.dart';
import 'package:suitmedia_test_submission/features/welcome/provider/welcome_provider.dart';
import 'package:suitmedia_test_submission/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PalindromProvider()),
        ChangeNotifierProvider(create: (context) => ThirdScreenProvider()),
        ChangeNotifierProvider(create: (context) => WelcomeProvider()),
      ],
      child: MaterialApp(
        title: 'Suitmedia',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        home: PalindromScreen(),
      ),
    );
  }
}
