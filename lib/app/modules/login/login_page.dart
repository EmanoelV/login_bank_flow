import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_bank_flow/app/widgets/widgets.dart';

import 'login_controller.dart';
import 'widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var loginPageWidget = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: ListView(
          children: [
            Icon(
              Icons.account_balance,
              size: MediaQuery.of(context).size.height * .3,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 16),
            Obx(() => Input(
                  labelText: "CPF",
                  controller: controller.inputCpfController.value,
                  onChange: (value) {
                    if (value.length == 11 && value.isCpf) {
                      controller.getKeys(value);
                    }
                  },
                  enabled: controller.inputCpfEnabled.isTrue,
                  keyboardType: TextInputType.number,
                )),
            SizedBox(height: 16),
            Obx(() => Input(
                  labelText: "Senha",
                  enabled: false,
                  obscureText: true,
                  controller: controller.inputPasswordController.value,
                )),
            SizedBox(height: 16),
            Obx(() => KeyboardKeys(
                // ignore: invalid_use_of_protected_member
                keys: controller.keys.value,
                deleteAction: controller.deleteKey,
                keyOnPressed: controller.keyOnPressed)),
            SizedBox(height: 16),
            Obx(() => ElevatedButton(
                onPressed: controller.loginButtonEnabled.isTrue
                    ? () {
                        controller.login();
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Entrar'),
                )))
          ],
        ),
      ),
    );
    return Scaffold(
        body: SafeArea(
      child: Obx(() => controller.loadingLogin.isTrue
          ? Center(
              child: CircularProgressIndicator(),
            )
          : loginPageWidget),
    ));
  }
}
