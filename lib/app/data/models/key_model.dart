class KeyModel {
  late String key;
  late List<String> values;

  KeyModel({required this.key, required this.values});

  KeyModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    values = json['values'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['values'] = this.values;
    return data;
  }
}
