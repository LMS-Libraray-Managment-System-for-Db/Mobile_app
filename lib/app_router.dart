import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/signup_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());
    }
  }
}
