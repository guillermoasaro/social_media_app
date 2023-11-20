import 'package:flutter/material.dart';

class Helpers {
  static bool isEmail(String text) {
    RegExp regexp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    final bool emailValid = regexp.hasMatch(text);

    return emailValid;
  }

  static void navigate({
    required BuildContext context,
    required Widget page,
    bool isReplacement = false,
  }) {
    if (isReplacement) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => page));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
    }
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }
    if (!Helpers.isEmail(value)) {
      return "Email is not in an accepted format";
    }
    return null;
  }
}
