import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shopping/app/networks/network_model/req/customer_register_req.dart';
import 'package:shopping/app/networks/network_model/res/customer_login_res.dart';
import 'package:shopping/app/networks/repo/auth_repo.dart';
import 'package:shopping/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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

  onLoginCLick(BuildContext context) async {
    AuthRepo repo = AuthRepo();
    final response = await repo.AuthSignin(CustomerRegisterReq(
      email: email.text,
      password: password.text,
    ));
    if (response != null && response.error == null) {
      Get.find<CustomerLoginRes>().token = response.token;
      Get.offAndToNamed(Routes.BOTTOMNAV);
    } else {
      MotionToast.error(
              title: const Text("Error"),
              description: Text(response!.error.toString()))
          .show(context);
    }
  }
}
