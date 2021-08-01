import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends TextFormField {
  static InputDecoration _decoration({String? labelText, String? hintText}) =>
      InputDecoration(labelText: labelText, hintText: hintText);

  Input(
      {Function(String?)? onSaved,
      List<TextInputFormatter>? inputFormatters,
      String? labelText})
      : super(
            onSaved: onSaved,
            inputFormatters: inputFormatters,
            decoration: _decoration(labelText: labelText));
}
