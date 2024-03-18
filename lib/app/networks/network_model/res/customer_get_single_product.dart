class CustomerGetSingleProductRes {
  String? error;
  Product? product;

  CustomerGetSingleProductRes({this.error, this.product});

  CustomerGetSingleProductRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
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
