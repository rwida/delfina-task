import 'package:flutter/material.dart';

import '../../../core/ui/screens/splash_screen.dart';
import '../../../features/home/presentation/pages/home_screen.dart';
import './app_routes.dart';
import './index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      // Splash Screen
      case AppRoute.splash:
        return _screenInit(const SplashScreen(), settings);

      // Home Screen
      case AppRoute.home:
        return _screenInit(const HomeScreen(), settings);

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static MaterialPageRoute<dynamic> _screenInit(Widget screen, RouteSettings? settings) {
    return MaterialPageRoute<dynamic>(builder: (_) => screen, settings: settings);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
