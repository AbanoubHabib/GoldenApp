import 'package:flutter/material.dart';
import 'package:goldenprice/core/router/app_routes.dart';
import 'package:goldenprice/features/auth/login_screen.dart';
import 'package:goldenprice/core/presentation/home_screen.dart';

class AppRouter {
  Route generaeRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        );

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
