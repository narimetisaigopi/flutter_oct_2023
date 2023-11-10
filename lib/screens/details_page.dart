import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String imageUrl, title, description;
  const DetailsPage(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: [
          Image.network(widget.imageUrl),
          Text(widget.title),
          Text(widget.description)
        ],
      ),
    );
  }
}
