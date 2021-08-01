import 'package:flutter/material.dart';

import 'package:login_bank_flow/app/data/models/models.dart';

import 'key_button.dart';

class KeyboardKeys extends StatelessWidget {
  final List<KeyModel> keys;
  final Function(String)? keyOnPressed;
  final Function()? deleteAction;
  KeyboardKeys(
      {Key? key, required this.keys, this.keyOnPressed, this.deleteAction})
      : super(key: key);

  String _buttonText(int index) =>
      '${keys[index].values[0]} ou ${keys[index].values[1]}';

  onPressed(String key) {
    keyOnPressed != null ? keyOnPressed!(key) : print(key);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(
              child: KeyButton(
                  text: _buttonText(0),
                  onPressed: () {
                    onPressed(keys[0].key);
                  })),
          SizedBox(width: 8),
          Expanded(
              child: KeyButton(
                  text: _buttonText(1),
                  onPressed: () {
                    onPressed(keys[1].key);
                  })),
          SizedBox(width: 8),
          Expanded(
              child: KeyButton(
                  text: _buttonText(2),
                  onPressed: () {
                    onPressed(keys[2].key);
                  })),
        ]),
        SizedBox(
          height: 8,
        ),
        Row(children: [
          Expanded(
              child: KeyButton(
                  text: _buttonText(3),
                  onPressed: () {
                    onPressed(keys[3].key);
                  })),
          SizedBox(width: 8),
          Expanded(
              child: KeyButton(
                  text: _buttonText(4),
                  onPressed: () {
                    onPressed(keys[4].key);
                  })),
          SizedBox(width: 8),
          Expanded(
              child:
                  KeyButton(text: 'Limpar', onPressed: deleteAction ?? () {})),
        ]),
      ],
    );
  }
}
