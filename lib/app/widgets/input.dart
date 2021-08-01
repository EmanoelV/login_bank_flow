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
      String? Function(String?)? validator,
      TextInputType? keyboardType,
      bool? enabled,
      bool obscureText = false,
      TextEditingController? controller,
      Function(String)? onChange,
      String? labelText})
      : super(
            onSaved: onSaved,
            obscureText: obscureText,
            onChanged: onChange,
            controller: controller,
            enabled: enabled,
            validator: validator,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            decoration: _decoration(labelText: labelText));
}
