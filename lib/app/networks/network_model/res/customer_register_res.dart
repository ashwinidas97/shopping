class CustomerRegisterRes {
  String? error;
  String? email;
  String? token;
  String? name;

  CustomerRegisterRes({this.error, this.email, this.token, this.name});

  CustomerRegisterRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    email = json['email'];
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['email'] = this.email;
    data['token'] = this.token;
    data['name'] = this.name;
    return data;
  }
}
