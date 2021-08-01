import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends TextFormField {
  static InputDecoration _decoration({String? labelText, String? hintText}) =>
      InputDecoration(
          labelText: labelText,
          hintText: hintText,
          isDense: true,
          border: OutlineInputBorder());

  Input(
      {Function(String?)? onSaved,
      List<TextInputFormatter>? inputFormatters,
      String? labelText})
      : super(
            onSaved: onSaved,
            inputFormatters: inputFormatters,
            decoration: _decoration(labelText: labelText));
}
