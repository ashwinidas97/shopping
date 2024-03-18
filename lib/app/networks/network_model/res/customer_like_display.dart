class CustomerProductLikeDisplayRes {
  String? error;
  List<LikedProducts>? likedProducts;

  CustomerProductLikeDisplayRes({this.error, this.likedProducts});

  CustomerProductLikeDisplayRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['likedProducts'] != null) {
      likedProducts = <LikedProducts>[];
      json['likedProducts'].forEach((v) {
        likedProducts!.add(new LikedProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.likedProducts != null) {
      data['likedProducts'] =
          this.likedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LikedProducts {
  String? sId;
  String? customerId;
  String? productId;
  int? iV;

  LikedProducts({this.sId, this.customerId, this.productId, this.iV});

  LikedProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customerId = json['customerId'];
    productId = json['productId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['customerId'] = this.customerId;
    data['productId'] = this.productId;
    data['__v'] = this.iV;
    return data;
  }
}
