import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/routing/routes.dart';
import 'package:weather_app/features/home/ui/home_screen/home_screen.dart';

class AppRouter {

  /// Returns a [Route] object that represents the generated route.
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return CupertinoPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('404'),
                  ),
                ));
    }
  }
}
