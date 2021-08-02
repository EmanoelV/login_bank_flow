import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:login_bank_flow/app/core/interfaces/interfaces.dart';
import 'package:login_bank_flow/app/data/models/models.dart';
import 'package:login_bank_flow/app/data/repostories/repositories.dart';

class ExtractController extends GetxController {
  final LoginModel loginData = Get.find();
  final ScrollController scrollController = ScrollController();
  final IExtractRepository _extractRepository =
      Get.put(GetxExtractRepository());
  final String initialDate =
      DateFormat("y-MM-dd").format(DateTime.now().subtract(Duration(days: 30)));
  final String endDate = DateFormat("y-MM-dd").format(DateTime.now());
  var transactions = <TransactionModel>[].obs;
  int indexPage = 0;

  ExtractController() {
    _loadTransactions();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) _loadTransactions();
    });
  }

  _loadTransactions() async {
    await _extractRepository
        .getTransactions(
            initialDate: initialDate,
            endDate: endDate,
            code: loginData.codigo,
            indexPage: indexPage.toString())
        .then((value) {
      transactions.addAll(value);
    }).catchError((error) {
      Get.snackbar("Erro",
          "Houve um erro inesperado, verifique sua conexão e tente novamente");
    });
    indexPage++;
  }
}
