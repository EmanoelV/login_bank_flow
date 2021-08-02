import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'package:login_bank_flow/app/core/constants.dart';
import 'package:login_bank_flow/app/core/interfaces/interfaces.dart';
import 'package:login_bank_flow/app/core/utils/utils.dart';
import 'package:login_bank_flow/app/data/models/models.dart';
import 'package:login_bank_flow/app/data/models/transaction_model.dart';

class GetxExtractRepository extends GetConnect implements IExtractRepository {
  LoginModel loginData = Get.find();

  @override
  void onInit() {
    super.onInit();
    httpClient.addRequestModifier((Headers.defaultHeader));
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.addAuthenticator(((Request request) {
      request.headers["Authorization"] = loginData.token;
      return request;
    }));
  }

  @override
  Future<List<TransactionModel>> getTransactions(
      {required String initialDate,
      required String endDate,
      required String code,
      required String indexPage}) async {
    final response = await get(
        "/v1/Extrato/Periodo?dataInicial=$initialDate&dataFinal=$endDate&pageSize=30&page=$indexPage&codigoConta=$code");
    final data = response.body['data'] as List;
    return data.map((e) => TransactionModel.fromJson(e)).toList();
  }
}
