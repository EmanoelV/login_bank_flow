class LoginModel {
  late String token;
  late String codigo;
  late String refreshToken;

  LoginModel(
      {required this.token, required this.codigo, required this.refreshToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    codigo = json['codigo'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['codigo'] = this.codigo;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
