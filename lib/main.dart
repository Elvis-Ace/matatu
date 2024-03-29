import 'package:flutter/material.dart';
import 'package:matatu/pages/auth/login.dart';
import 'package:matatu/pages/homeview.dart';
import 'package:matatu/pages/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    title: "Matatu",
    theme: ThemeData(),
    initialRoute: '/homepage',
    routes: {
      '/': (context) => const SplashScreen(),
      '/login': (context) => const LoginView(),
      '/homepage':(context)=>const HomeView()
    }
  ));
}

