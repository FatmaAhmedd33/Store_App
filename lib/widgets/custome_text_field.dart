import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.onchange, super.key, required this.text, this.textInputType});
  final String text;
  Function(String)? onchange;
  TextInputType ?textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
        //chang from textfield to text form field to able make a validation conditions
keyboardType: textInputType,
        onChanged: onchange,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide()),
          hintText: text,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          border: const OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ));
  }
}
