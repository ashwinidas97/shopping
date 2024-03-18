class CustomerLoginReq {
  String? error;
  String? email;
  String? password;

  CustomerLoginReq({this.error, this.email, this.password});

  CustomerLoginReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
