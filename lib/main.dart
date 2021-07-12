import 'package:country_list/bindings/splash_binding.dart';
import 'package:country_list/screens/nav_screen.dart';
import 'package:country_list/screens/splash_screen.dart';
import 'package:country_list/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/nav',
          page: () => NavScreen(),
        )
      ],
    );
  }
}
