import 'package:login_bank_flow/app/data/models/models.dart';

abstract class IExtractRepository {
  Future<List<TransactionModel>> getTransactions(
      {required String initialDate,
      required String endDate,
      required String code,
      required String indexPage});
}
