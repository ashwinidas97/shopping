class CustomerGetNameRes {
  String? error;
  String? sId;
  String? email;
  String? name;
  int? iV;

  CustomerGetNameRes({this.error, this.sId, this.email, this.name, this.iV});

  CustomerGetNameRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    sId = json['_id'];
    email = json['email'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['__v'] = this.iV;
    return data;
  }
}
