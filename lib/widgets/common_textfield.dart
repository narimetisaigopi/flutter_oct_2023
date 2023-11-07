import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData prefixIconData;
  final double labelFontSize;
  const CommonTextField(
      {super.key,
      required this.hintText,
      this.labelText = "",
      this.labelFontSize = 16,
      required this.prefixIconData});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // maxLines: 3,
      maxLength: 100,
      enabled: true,
      //   keyboardType: TextInputType.multiline,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefixIcon: Icon(widget.prefixIconData),
          suffix: Icon(Icons.check_outlined),
          // label: Widget()` try your self
          labelStyle: TextStyle(fontSize: widget.labelFontSize),
          hintStyle: TextStyle(),
          counterText: "",
          counterStyle: TextStyle(),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
          errorBorder: OutlineInputBorder()),
    );
  }
}
