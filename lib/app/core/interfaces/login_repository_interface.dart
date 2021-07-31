import 'package:login_bank_flow/app/data/models/key_model.dart';

abstract class ILoginRepository {
  Future<List<KeyModel>> getKeys(String cpf);
}
