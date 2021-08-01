import 'package:get/get.dart';

import 'package:login_bank_flow/app/core/constants.dart';
import 'package:login_bank_flow/app/core/interfaces/interfaces.dart';
import 'package:login_bank_flow/app/core/utils/utils.dart';

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

  @override
  Future<LoginModel> login(String cpf, String password) async {
    final bodyTokens = {
      "data": {"cpf": cpf, "senha": password}
    };
    final responseTokens = await post("/v1/Autenticacao/Login", bodyTokens);
    Map<String, String> data = {
      "token": responseTokens.body['data']['token'],
      "refreshToken": responseTokens.body['data']['refreshToken']
    };
    final accountsResponse = await get('/v1/Conta/Usuario?usuario=$cpf',
        headers: {"Authorization": data['token'] as String});
    data['codigo'] = accountsResponse.body['data'][0]['codigo'];
    final bodyAuth = {
      "refreshToken": data['refreshToken'].toString(),
      "codigoConta": data['codigo'].toString()
    };
    final authResponse = await post("/v1/Autenticacao/AuthCompany", bodyAuth,
        headers: {"Authorization": data['token'] as String});
    data['token'] = authResponse.body['data']['token'];
    data['refreshToken'] = authResponse.body['data']['refreshToken'];
    return LoginModel.fromJson(data);
  }
}
