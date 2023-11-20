import 'package:flutter/material.dart';
import 'package:flutter_telugu/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
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
          // fontFamily: "Agbalumo",
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
      onGenerateRoute: (settings) {
        return onGenerateRoute(settings);
      },
      initialRoute: '/',
      // routes: {
      //   "/": (context) => const SplashScreen(),
      //   LoginScreen.routeName: (context) => const LoginScreen(),
      //   "/registrationScreen": (context) => const RegistrationScreen(),
      //   HomeScreen.routeName: (context) => const HomeScreen(
      //         email: "",
      //       ),
      // },
    );
  }
}
