import 'package:flutter/material.dart';
import 'package:flutter_telugu/screens/auth/login_screen.dart';
import 'package:flutter_telugu/screens/home_screen.dart';
import 'package:flutter_telugu/screens/page_not_found.dart';
import 'package:flutter_telugu/screens/splash_screen.dart';

onGenerateRoute(RouteSettings routeSettings) {
  print("routeSettings name ${routeSettings.name}");
  print("routeSettings arguments ${routeSettings.arguments}");
  if (routeSettings.name == "/") {
    return MaterialPageRoute(builder: (builder) => const SplashScreen());
  } else if (routeSettings.name == LoginScreen.routeName) {
    return MaterialPageRoute(builder: (builder) => const LoginScreen());
  } else if (routeSettings.name == HomeScreen.routeName) {
    return MaterialPageRoute(
        builder: (builder) =>
            HomeScreen(email: (routeSettings.arguments as List)[0]));
  } else {
    return MaterialPageRoute(builder: (builder) => const PageNotFound());
  }
}
