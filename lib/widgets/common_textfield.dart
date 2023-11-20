import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final IconData? prefixIconData;
  final IconData? sufixIconData;
  final double labelFontSize;
  final Function(String?) validator;
  final Function(String)? onChanged;
  const CommonTextField(
      {super.key,
      required this.hintText,
      this.labelText = "",
      this.labelFontSize = 16,
      this.prefixIconData,
      this.sufixIconData,
      required this.validator,
      required this.textEditingController,
      this.onChanged});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      // maxLines: 3,
      maxLength: 100,
      enabled: true,
      // validator: (str) => widget.validator(str),
      // validator: widget.validator != null
      //     ? (str) {
      //         return widget.validator(str ?? "");
      //       }
      //     : null,
      validator: widget.validator != null
          ? (str) {
              return widget.validator.call(str ?? "");
            }
          : null,
      onChanged: widget.onChanged,
      //   keyboardType: TextInputType.multiline,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefixIcon: widget.prefixIconData != null
              ? Icon(widget.prefixIconData)
              : null,
          suffix:
              widget.sufixIconData != null ? Icon(Icons.check_outlined) : null,
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
