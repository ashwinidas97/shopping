import 'package:shopping/app/networks/dio_client.dart';

enum EndPoints {
  login,
  register,
  getCustomerDetails,
  customerProduct,
  customerProductbycat,
  customerProductLike,
  customerProductUnlike,
  customerProductLikeDisplay,
  customerProductLikeDisplayAll,
  customerGetSingleProduct,
}

extension EndPointsData on EndPoints {
  String path() {
    String path = "";
    switch (this) {
      case EndPoints.login:
        path = "customer/users/login";
      case EndPoints.register:
        path = "customer/users/signup";
      case EndPoints.getCustomerDetails:
        path = "customer/users/single";
      case EndPoints.customerProduct:
        path = "customer/products";
      case EndPoints.customerProductbycat:
        path = "customer/products";
      case EndPoints.customerProductLike:
        path = "customer/products/like";
      case EndPoints.customerProductUnlike:
        path = "customer/products/unlike";
      case EndPoints.customerProductLikeDisplay:
        path = "customer/products/like/display";
      case EndPoints.customerProductLikeDisplayAll:
        path = "customer/products/like/displayall";
      case EndPoints.customerGetSingleProduct:
        path = "customer/products/product";
    }
    return path;
  }

  ReqType type() {
    ReqType type;
    switch (this) {
      case EndPoints.login:
        type = ReqType.POST;
      case EndPoints.register:
        type = ReqType.POST;
      case EndPoints.getCustomerDetails:
        type = ReqType.GET;
      case EndPoints.customerProduct:
        type = ReqType.GET;
      case EndPoints.customerProductbycat:
        type = ReqType.GET;
      case EndPoints.customerProductLike:
        type = ReqType.POST;
      case EndPoints.customerProductUnlike:
        type = ReqType.POST;
      case EndPoints.customerProductLikeDisplay:
        type = ReqType.GET;
      case EndPoints.customerProductLikeDisplayAll:
        type = ReqType.GET;
      case EndPoints.customerGetSingleProduct:
        type = ReqType.GET;
    }
    return type;
  }

  bool hasToken() {
    bool token = false;
    switch (this) {
      case EndPoints.login:
        token = false;
      case EndPoints.register:
        token = false;
      case EndPoints.getCustomerDetails:
        token = true;
      case EndPoints.customerProduct:
        token = false;
      case EndPoints.customerProductbycat:
        token = false;
      case EndPoints.customerProductLike:
        token = true;
      case EndPoints.customerProductUnlike:
        token = true;
      case EndPoints.customerProductLikeDisplay:
        token = true;
      case EndPoints.customerProductLikeDisplayAll:
        token = true;
      case EndPoints.customerGetSingleProduct:
        token = false;
    }
    return token;
  }
}
