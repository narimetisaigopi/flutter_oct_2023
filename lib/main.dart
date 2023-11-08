import 'package:flutter/material.dart';
import 'package:flutter_telugu/screens/auth/login_screen.dart';
import 'package:flutter_telugu/screens/auth/registration_screen.dart';
import 'package:flutter_telugu/screens/splash_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.red,
      title: 'My flutter App',
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Agbalumo",
          appBarTheme: const AppBarTheme(centerTitle: true),
          // textTheme: GoogleFonts.abhayaLibreTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true),
      darkTheme: ThemeData(
          appBarTheme: const AppBarTheme(centerTitle: true),
          textTheme: const TextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: false),
      themeMode: ThemeMode.system,
      // onGenerateRoute: ,
      // onGenerateInitialRoutes: ,
      initialRoute: '/',
      routes: {
        "/": (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        "/registrationScreen": (context) => const RegistrationScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(
              email: "",
            ),
      },
    );
  }
}
