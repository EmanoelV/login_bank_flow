import 'package:flutter/material.dart';

import 'package:login_bank_flow/app/widgets/widgets.dart';
import 'package:login_bank_flow/app/data/models/models.dart';

import 'widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final List<KeyModel> _defaultKeys = List.generate(5,
      (index) => KeyModel(key: 'default', values: ['$index', '${index + 1}']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              Icons.account_balance,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 16),
            Input(
              labelText: "CPF",
            ),
            SizedBox(height: 16),
            Input(
              labelText: "Senha",
            ),
            SizedBox(height: 16),
            KeyboardKeys(keys: _defaultKeys)
          ],
        ),
      ),
    ));
  }
}
