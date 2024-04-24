import 'package:flutter/material.dart';
import 'package:weather_app/weather_app.dart';
import 'core/helpers/functions_helper.dart';
import 'core/routing/app_router.dart';
import 'core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 /// * debncies enjection
  await ServicesLocator().init();
// * get curren location
  await FunnctionsHelper.getLocation();

  runApp(WeatherApp(
    appRouter: AppRouter(),
  ));
}
