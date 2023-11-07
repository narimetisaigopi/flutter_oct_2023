import 'package:flutter/material.dart';
import 'package:flutter_telugu/screens/auth/registration_screen.dart';

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
      home:  const RegistrationScreen(),
    );
  }
}
