import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:shopping/app/data/colors.dart';
import 'package:shopping/app/modules/details/controllers/details_controller.dart';
import 'package:shopping/app/widgets/common_button.dart';
import 'package:shopping/app/widgets/image_slider.dart';

class DetailPageView extends GetView<DetailsController> {
  const DetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsController());
    final arg = Get.arguments;
    print(arg);
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Product Details',
              style: TextStyle(
                color: AppColor.green,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ) // You can set the color of the text
              ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: controller.featchSingleProduct(arg),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageSlideshow(
                        /// Width of the [ImageSlideshow].
                        width: double.infinity,

                        /// Height of the [ImageSlideshow].
                        height: 200,

                        /// The page to show when first creating the [ImageSlideshow].
                        initialPage: 0,

                        /// The color to paint the indicator.
                        indicatorColor: AppColor.green,

                        /// The color to paint behind th indicator.
                        indicatorBackgroundColor: Colors.grey,

                        /// The widgets to display in the [ImageSlideshow].
                        /// Add the sample image file into the images folder
                        children: [
                          for (var i in snapshot.data!.product!.image!)
                            Image.network(i),
                        ],

                        /// Called whenever the page in the center of the viewport changes.
                        onPageChanged: (value) {
                          print('Page changed: $value');
                        },

                        /// Auto scroll interval.
                        /// Do not auto scroll with null or 0.

                        /// Loops back to first slide.
                        isLoop: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data!.product!.name!,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            snapshot.data!.product!.discount!,
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColor.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            snapshot.data!.product!.price!,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 20,
                              color: AppColor.darkGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data!.product!.about!,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.darkGrey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommonButton(
                              btnButtonWidth: double.infinity,
                              btnText: 'Buy Now',
                              btnHeight: 50,
                              btnOnPressed: () {
                                // Get.to(EditPageView());
                              },
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }),
        )));
  }
}
