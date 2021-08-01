import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_bank_flow/app/core/interfaces/interfaces.dart';
import 'package:login_bank_flow/app/data/models/models.dart';
import 'package:login_bank_flow/app/data/repostories/repositories.dart';

class LoginController extends GetxController {
  final ILoginRepository login = DioLoginRepository();
  var inputCpfEnabled = true.obs;
  var inputPasswordController = TextEditingController().obs;
  var loginButtonEnabled = false.obs;
  var keys = List.generate(
      5, (index) => KeyModel(key: 'X', values: ['$index', '${index + 1}'])).obs;

  setInputCpfEnabled(bool value) => inputCpfEnabled.value = value;
  keyOnPressed(String key) {
    if (inputCpfEnabled.isFalse) inputPasswordController.value.text += key;
    if (inputPasswordController.value.text.length > 7)
      loginButtonEnabled.value = true;
  }

  getKeys(String cpf) {
    login.getKeys(cpf).then((value) {
      keys.value = value;
      inputCpfEnabled.value = false;
    });
  }
}
