import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shopping/app/networks/network_model/req/customer_register_req.dart';
import 'package:shopping/app/networks/repo/auth_repo.dart';

class RegisterController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repassword = TextEditingController();
  bool showPassword = true;
  var isPasswordValid = true.obs;

  final count = 0.obs;
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

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    update(); // Call update to update the UI when the password visibility changes.
  }

  void validateConfirmPassword() {
    // Add your confirm password validation logic here
    // For example, check if it matches the password
    isPasswordValid.value = password.value == repassword.value;
  }

  onRegisterClick(BuildContext context) async {
    final AuthRepo repo = AuthRepo();
    final response = await repo.AuthSignup(CustomerRegisterReq(
      email: email.text,
      name: fname.text,
      password: password.text,
    ));

    if (response != null && response.error == null) {
      MotionToast.success(
        title: const Text("Registration is Success"),
        description: const Text("Your account is created"),
      ).show(context);
      Get.back();
    } else {
      MotionToast.error(
              title: const Text("Error"),
              description: Text(response!.error.toString()))
          .show(context);
    }
  }
}
