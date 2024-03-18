import 'package:get/get.dart';
import 'package:shopping/app/networks/network_model/res/customer_get_single_product.dart';
import 'package:shopping/app/networks/repo/customer_product_repo.dart';

class DetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<CustomerGetSingleProductRes?> featchSingleProduct(id) {
    final CustomerProductRepo repo = CustomerProductRepo();
    final response = repo.getCustomerSingleProduct(id);
    return response;
  }
}
