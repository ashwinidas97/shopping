class CustomerProductLikeRes {
  String? error;
  String? message;
  LikedProduct? likedProduct;

  CustomerProductLikeRes({this.error, this.message, this.likedProduct});

  CustomerProductLikeRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json[' message'];
    likedProduct = json['likedProduct'] != null
        ? new LikedProduct.fromJson(json['likedProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data[' message'] = this.message;
    if (this.likedProduct != null) {
      data['likedProduct'] = this.likedProduct!.toJson();
    }
    return data;
  }
}

class LikedProduct {
  String? customerId;
  String? productId;
  String? sId;
  int? iV;

  LikedProduct({this.customerId, this.productId, this.sId, this.iV});

  LikedProduct.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    productId = json['productId'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['productId'] = this.productId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
