import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_telugu/main.dart';
import 'package:flutter_telugu/screens/auth/login_screen.dart';
import 'package:flutter_telugu/screens/dashboard_screen.dart';
import 'package:flutter_telugu/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    log("SplashScreen initstate called");
    Timer(const Duration(seconds: 3), () {
      Utils.printLog("SplashScreen initstate after 5 seconds");
      // user login
      // home screen
      // user not logged in
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (builder) => const LoginScreen()),
      // );
      // Navigator.pushNamedAndRemoveUntil(
      //     context, LoginScreen.routeName, (sa) => false,
      //     arguments: [""]);
      // Navigator.pushNamedAndRemoveUntil(
      //     context, LoginScreen.routeName, (sa) => false);
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (builder) => const LoginScreen()),
      //     (route) => false);
      // Navigator.push(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (_, __, ___) => LoginScreen(),
      //     transitionDuration: Duration(seconds: 2),
      //     transitionsBuilder: (_, a, __, c) =>
      //         FadeTransition(opacity: a, child: c),
      //   ),
      // );
      bool isLoggedIn = sharedPreferences.getBool("isLoggedIn") ?? false;
      if (isLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => const DashboardScreen(
                    email: '',
                  )),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => const LoginScreen()),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/India_Farming.jpg"),
          const SizedBox(
            height: 20,
          ),
          const Center(child: Text("Farmers App"))
        ],
      ),
    );
  }
}
