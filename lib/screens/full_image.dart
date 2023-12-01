import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  String url;
  FullImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.network(url));
  }
}
