class LoginModel {
  late String token;
  late String usuario;
  late String refreshToken;

  LoginModel(
      {required this.token, required this.usuario, required this.refreshToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    usuario = json['usuario'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['usuario'] = this.usuario;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
