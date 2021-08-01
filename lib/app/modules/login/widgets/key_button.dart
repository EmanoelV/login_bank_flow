import 'package:flutter/material.dart';

class KeyButton extends OutlinedButton {
  static ButtonStyle _buttonStyle() => ButtonStyle();
  static TextStyle _textStyle() => TextStyle(fontSize: 12);

  KeyButton({required String text, required Function() onPressed})
      : super(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: Text(text, style: _textStyle()),
            ),
            onPressed: onPressed,
            style: _buttonStyle());
}
