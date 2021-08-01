import 'package:get/get.dart';

import 'package:login_bank_flow/app/core/constants.dart';
import 'package:login_bank_flow/app/core/interfaces/interfaces.dart';
import 'package:login_bank_flow/app/core/utils/headers.dart';

import '../models/models.dart';

class GetxLoginRepository extends GetConnect implements ILoginRepository {
  @override
  void onInit() {
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.addRequestModifier(Headers.defaultHeader);
    super.onInit();
  }

  @override
  Future<List<KeyModel>> getKeys(String cpf) async {
    final body = {
      "data": {"cpf": cpf}
    };
    final response = await post("/v1/Autenticacao/Challenge", body);
    final data = response.body['data']['keys'] as List;
    final keyList = data.map((e) => KeyModel.fromJson(e)).toList();
    return keyList;
  }
}
