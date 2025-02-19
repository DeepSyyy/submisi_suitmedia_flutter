import 'package:flutter/material.dart';
import 'package:suitmedia_test_submission/features/palindrom/page/is_palindrom_screen.dart';
import 'package:suitmedia_test_submission/features/user_list/presentation/page/third_page.dart';
import 'package:suitmedia_test_submission/features/welcome/welcome_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialPageRoute(PalindromScreen());
      case '/welcome':
        final args = settings.arguments as WelcomeScreen;
        return _materialPageRoute(WelcomeScreen(name: args.name));
      case '/third_page':
        return _materialPageRoute(ThirdPage());
      default:
        return _materialPageRoute(
          const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }

  static Route<dynamic> _materialPageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
