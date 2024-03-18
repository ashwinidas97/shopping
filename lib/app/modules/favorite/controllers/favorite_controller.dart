import 'dart:async';

import 'package:get/get.dart';
import 'package:shopping/app/networks/network_model/res/customer_like_display.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_res.dart';
import 'package:shopping/app/networks/network_model/res/liked_all_data_res.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class FavoriteController extends GetxController {
  final StreamController<CustomerProductRes?> _fetchCustomerAllProductByLiked =
      StreamController<CustomerProductRes?>.broadcast();

  Stream<CustomerProductRes?> get fetchCustomerProductByLiked =>
      _fetchCustomerAllProductByLiked.stream;

  final StreamController<CustomerProductLikeDisplayAllRes?>
      _fetchCustomerProductBLiked =
      StreamController<CustomerProductLikeDisplayAllRes?>.broadcast();

  Stream<CustomerProductLikeDisplayAllRes?> get fetchCustomerProductLiked =>
      _fetchCustomerProductBLiked.stream;

  @override
  void onInit() {
    super.onInit();
    fetchCustomerAllProductLiked();
    fetchCustomerAllProductByLiked('');
  }

  @override
  void onReady() {
    super.onReady();
    fetchCustomerAllProductLiked();
    fetchCustomerAllProductByLiked('');
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchCustomerAllProductByLiked(cat) async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.getCustomerProductByCatcories('');
    _fetchCustomerAllProductByLiked.add(response!);
  }

  onlikeProduct(String productId) async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.likeProduct(productId);
    if (response != null) {
      fetchCustomerAllProductLiked();
    }
  }

  onUnlikeClick(String Id) async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.unlikeProduct(Id);
    if (response != null) {
      fetchCustomerAllProductLiked();
    }
  }

  Future fetchCustomerAllProductLiked() async {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = await repo.getCustomerProductLikeDisplayAll();

    _fetchCustomerProductBLiked.add(response!);
    update();
  }
}
