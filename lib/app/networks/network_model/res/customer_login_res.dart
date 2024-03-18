class CustomerLoginRes {
  String? error;
  String? email;
  String? token;

  CustomerLoginRes({this.error, this.email, this.token});

  CustomerLoginRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
