import 'package:login_bank_flow/app/data/models/models.dart';

abstract class ILoginRepository {
  Future<List<KeyModel>> getKeys(String cpf);
  Future<LoginModel> login(String cpf, String password);
}
