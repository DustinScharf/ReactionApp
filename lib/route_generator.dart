import 'package:flutter/material.dart';
import 'package:reation_app/highscores.dart';
import 'package:reation_app/main.dart';
import 'package:reation_app/my_home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: "ReactionApp"));
      case '/second':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => const HighscorePage(
              data: '',
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Route Error'),
        ),
        body: const Center(
          child: Text('ROUTE ERROR'),
        ),
      );
    });
  }
}
