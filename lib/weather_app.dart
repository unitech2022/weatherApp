import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/home/provider/home_provider.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/services/services_locator.dart';
import 'core/styles/colors_app.dart';
import 'features/forecast/provider/forcast_provider.dart';

class WeatherApp extends StatelessWidget {
  // create instance of app router
  final AppRouter appRouter;
  const WeatherApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<HomeProvider>()),
        ChangeNotifierProvider(create: (_) => sl<ForcastProvider>()),
      ],
      /// add ScreenUtilInit for responsive design
      child: ScreenUtilInit(
        designSize: const Size(468, 963),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  backgroundColor: ColorsApp.backgroundColor,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light)),
              primaryColor: ColorsApp.mainColor,
              scaffoldBackgroundColor: ColorsApp.backgroundColor),
              
          initialRoute: Routes.home,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
