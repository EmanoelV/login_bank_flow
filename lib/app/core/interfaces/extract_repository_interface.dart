import 'package:login_bank_flow/app/data/models/models.dart';

abstract class IExtractRepository {
  Future<List<TransactionModel>> getFirstTransactions();
  Future<List<TransactionModel>> getNextTransactions(String index);
}
