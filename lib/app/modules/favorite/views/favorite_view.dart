import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/app/modules/details/views/details_view.dart';
import 'package:shopping/app/widgets/product_card.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());

    controller.fetchCustomerAllProductLiked();
    controller.fetchCustomerAllProductLiked();

    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white, // Added this line
        elevation: 0.0, // Added this line
        title: Center(
          child: Text(
            'Favorite',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: InkWell(
        onTap: () {
          Get.to(DetailPageView());
        },
        child: StreamBuilder(
            stream: controller.fetchCustomerProductLiked,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 90, left: 10, right: 10),
                  child: snapshot.data!.likedProducts!.isEmpty
                      ? Container()
                      : GridView.count(
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          shrinkWrap: true,
                          childAspectRatio:
                              MediaQuery.of(context).size.width < 600
                                  ? 0.57
                                  : 1,
                          physics: NeverScrollableScrollPhysics(),
                          children: List.generate(
                              snapshot.data!.likedProducts!.length, (index) {
                            final a = snapshot.data!.likedProducts![index];
                            // Your code here
                            return Stack(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.width,
                                  width: MediaQuery.of(context).size.width,
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => DetailPageView(),
                                          arguments: a.product!.sId.toString());
                                    },
                                    child: StreamBuilder(
                                      stream:
                                          controller.fetchCustomerProductLiked,
                                      builder: (context, snapshot) {
                                        return ProductCard(
                                          name: a.product!.name ?? '',
                                          price: a.product!.price ?? '',
                                          disprice: a.product!.discount ?? '',
                                          image: a.product!.image?[0] ?? '',
                                          onPressed: () async {
                                            controller
                                                .onlikeProduct(a.sId.toString())
                                                .then((_) async {
                                              // Call the uploadImages function to upload the selected images
                                              await controller
                                                  .fetchCustomerAllProductLiked();
                                            });

                                            print('aaaaaaaaa');
                                          },
                                          productId: a.product!.sId.toString(),
                                          likedId:
                                              snapshot.data!.likedProducts!,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                            // Replace Container() with your desired widget
                          }),
                        ),
                );
              }
            }),
      )),
    );
  }
}
