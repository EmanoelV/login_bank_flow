import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_bank_flow/app/core/interfaces/interfaces.dart';
import 'package:login_bank_flow/app/data/models/models.dart';
import 'package:login_bank_flow/app/data/repostories/repositories.dart';

class LoginController extends GetxController {
  final ILoginRepository loginRepository = Get.put(GetxLoginRepository());
  var loadingLogin = false.obs;
  var inputCpfEnabled = true.obs;
  var inputPasswordController = TextEditingController().obs;
  var inputCpfController = TextEditingController().obs;
  var loginButtonEnabled = false.obs;
  var keys = List.generate(
      5, (index) => KeyModel(key: 'X', values: ['$index', '${index + 1}'])).obs;

  setInputCpfEnabled(bool value) => inputCpfEnabled.value = value;
  keyOnPressed(String key) {
    if (inputCpfEnabled.isFalse) inputPasswordController.value.text += key;
    if (inputPasswordController.value.text.length > 7)
      loginButtonEnabled.value = true;
  }

  deleteKey() {
    final currentText = inputPasswordController.value.text;
    if (currentText.length > 0)
      inputPasswordController.value.text =
          currentText.substring(0, currentText.length - 1);
    if (inputPasswordController.value.text.length < 8 &&
        loginButtonEnabled.isTrue) loginButtonEnabled.value = false;
  }

  getKeys(String cpf) {
    loginRepository.getKeys(cpf).then((value) {
      keys.value = value;
      inputCpfEnabled.value = false;
    });
  }

  _resetValues() {
    loadingLogin.value = false;
    inputCpfEnabled.value = true;
    loginButtonEnabled.value = false;
    inputCpfController.value.text = "";
    inputPasswordController.value.text = "";
    keys.value = List.generate(
        5, (index) => KeyModel(key: 'X', values: ['$index', '${index + 1}']));
  }

  login() {
    loadingLogin.value = true;
    loginRepository
        .login(
            inputCpfController.value.text, inputPasswordController.value.text)
        .then((value) {
      Get.put(
          LoginModel(
              token: value.token,
              codigo: value.codigo,
              refreshToken: value.refreshToken),
          permanent: true);
      Get.offAllNamed('/extract', arguments: value);
    }).catchError((error) {
      Get.snackbar(
          "Erro", "Houve um erro, verifique sua conexão e tente novamente");
      _resetValues();
    });
  }
}
