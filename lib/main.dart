import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping/app/networks/network_model/res/customer_login_res.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(CustomerLoginRes());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
