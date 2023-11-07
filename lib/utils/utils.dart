import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  static showToast(String message, {Color bgColor = Colors.black}) {
    Fluttertoast.showToast(msg: message,backgroundColor: bgColor);
  }
}
