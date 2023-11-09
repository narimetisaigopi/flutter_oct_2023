import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/ProfileScreen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("Profile Screen"),
    );
  }
}
