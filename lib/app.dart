import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './core/ui/resources/app_pallete.dart';
import './core/ui/resources/app_routes.dart';
import './core/ui/resources/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: AppRoute.splash,
        theme: ThemeData(
          primaryColor: AppPalette.primaryColor,
          unselectedWidgetColor: Colors.blue.shade900,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppPalette.accentColor, background: AppPalette.backgroundColor),
        ),
      ),
    );
  }
}
