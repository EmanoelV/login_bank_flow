import 'package:dio/dio.dart';

import 'package:login_bank_flow/app/core/constants.dart';
import 'package:login_bank_flow/app/core/interfaces/interfaces.dart';

import '../models/models.dart';

class DioLoginRepository implements ILoginRepository {
  final _dio = Dio(BaseOptions(baseUrl: Constants.baseUrl));

  @override
  Future<List<KeyModel>> getKeys(String cpf) async {
    final body = {
      "data": {"cpf": cpf}
    };
    final response = await _dio.post("/v1/Autenticacao/Challenge", data: body);

    final data = response.data['data']['keys'] as List;
    final keyList = data.map((e) => KeyModel.fromJson(e)).toList();
    return keyList;
  }
}
