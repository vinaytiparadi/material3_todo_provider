import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      duration: const Duration(milliseconds: 400),
        content: Text(text), backgroundColor: Colors.redAccent,);
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}