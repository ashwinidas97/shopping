import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  final String categoryName;
  final Function(String) onPressed;

  Categories({required this.categoryName, required this.onPressed});

  final RxBool _isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          _isSelected.toggle();
          onPressed(categoryName);
        },
        child: Obx(
          () => Container(
            width: 100,
            decoration: BoxDecoration(
              color: _isSelected.value ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: _isSelected.value ? Colors.white : Colors.grey[600],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Obx(() => Categories(
                  categoryName: 'All',
                  onPressed: (p0) {
                    controller.fetchCustomerProductByCatc(p0);
                  },
                )),
            Obx(() => Categories(
                  categoryName: 'Mobile',
                  onPressed: (p0) {
                    controller.fetchCustomerProductByCatc(p0);
                  },
                )),
            Obx(() => Categories(
                  categoryName: 'Tv',
                  onPressed: (p0) {
                    controller.fetchCustomerProductByCatc(p0);
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  final RxString selectedCategory = ''.obs;

  void fetchCustomerProductByCatc(String category) {
    selectedCategory.value = category;
    // Your implementation here
  }
}
