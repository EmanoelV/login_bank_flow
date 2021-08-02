class TransactionModel {
  late String tipoLancamento;
  late String descricaoOperacao;
  late String dataMovimento;
  late double valorMovimento;

  TransactionModel(
      {required this.tipoLancamento,
      required this.descricaoOperacao,
      required this.dataMovimento,
      required this.valorMovimento});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    tipoLancamento = json['tipoLancamento'];
    descricaoOperacao = json['descricaoOperacao'];
    dataMovimento = json['dataMovimento'];
    valorMovimento = json['valorMovimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipoLancamento'] = this.tipoLancamento;
    data['descricaoOperacao'] = this.descricaoOperacao;
    data['dataMovimento'] = this.dataMovimento;
    data['valorMovimento'] = this.valorMovimento;
    return data;
  }
}
