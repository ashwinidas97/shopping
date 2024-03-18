class CustomerProductLikeDisplayAllRes {
  String? error;
  List<LikedProducts>? likedProducts;

  CustomerProductLikeDisplayAllRes({this.error, this.likedProducts});

  CustomerProductLikeDisplayAllRes.fromJson(Map<String, dynamic> json) {
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
  Product? product;

  LikedProducts(
      {this.sId, this.customerId, this.productId, this.iV, this.product});

  LikedProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customerId = json['customerId'];
    productId = json['productId'];
    iV = json['__v'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['customerId'] = this.customerId;
    data['productId'] = this.productId;
    data['__v'] = this.iV;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? sId;
  String? name;
  List<String>? image;
  String? about;
  String? price;
  String? categories;
  String? discount;
  int? iV;

  Product(
      {this.sId,
      this.name,
      this.image,
      this.about,
      this.price,
      this.categories,
      this.discount,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'].cast<String>();
    about = json['about'];
    price = json['price'];
    categories = json['categories'];
    discount = json['discount'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['about'] = this.about;
    data['price'] = this.price;
    data['categories'] = this.categories;
    data['discount'] = this.discount;
    data['__v'] = this.iV;
    return data;
  }
}
