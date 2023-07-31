import 'package:flutter/material.dart';
import 'package:phenx/main.dart';

class UtilsGreen {
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar =
        SnackBar(content: Text(text), backgroundColor: Colors.green);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
