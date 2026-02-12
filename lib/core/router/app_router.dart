import 'package:flutter/material.dart';
import 'package:goldenprice/core/router/app_routes.dart';
import 'package:goldenprice/features/silver/screens/silver_screen.dart';

import '../../features/gold/presentation/screens/home_screen.dart';
import '../../features/gold/presentation/screens/gold_screen.dart';


class AppRouter {
  Route generaeRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );

      case AppRoutes.goldScreen:
        return MaterialPageRoute(
          builder: (context) {
            return GoldScreen();
          },
        );
        case AppRoutes.silverScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SilverScreen();
          },
        );

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
