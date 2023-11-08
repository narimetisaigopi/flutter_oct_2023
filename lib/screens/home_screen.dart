import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";
  final String email;
  const HomeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Text("Logged as : $email "),
    );
  }
}
