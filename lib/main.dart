import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:matatu/pages/auth/login.dart';
import 'package:matatu/pages/auth/otpverify.dart';
import 'package:matatu/pages/dashboard/routeview.dart';
import 'package:matatu/pages/homeview.dart';
import 'package:matatu/pages/matatuview.dart';
import 'package:matatu/pages/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    title: "Matatu",
    theme: ThemeData(),
    initialRoute: '/login',
    builder: EasyLoading.init(),
    routes: {
      '/': (context) => const SplashScreen(),
      '/login': (context) => const LoginView(),
      '/homepage':(context)=>const HomeView(),
      '/routes':(context)=>RoutesView(),
      '/matatu':(context)=>MatatuView()
    }
  ));
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
