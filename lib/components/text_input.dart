import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController inputController;
  final MaterialColor mainColor;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final String? Function(String? value)? validator;

  const TextInput(
      {super.key,
      required this.inputController,
      this.mainColor = Colors.green,
      this.obscureText = false,
      required this.labelText,
      required this.hintText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: mainColor,
      controller: inputController,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        labelText: labelText,
        floatingLabelStyle: TextStyle(color: mainColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: mainColor),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
