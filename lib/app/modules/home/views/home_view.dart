import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/app/modules/details/views/details_view.dart';
import 'package:shopping/app/modules/favorite/views/favorite_view.dart';
import 'package:shopping/app/widgets/categories.dart';
import 'package:shopping/app/widgets/favorite_icon.dart';
import 'package:shopping/app/widgets/product_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    controller.onInit();

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: SizedBox(
          width: MediaQuery.of(context).size.width > 1200
              ? MediaQuery.of(context).size.width * 0.3
              : double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                            future: controller.featchName(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                return Text(
                                  "Hello, ${snapshot.data!.name}",
                                  style: GoogleFonts.lobster(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                );
                              }
                            }),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Let's get something...!",
                          style: GoogleFonts.lobster(
                            fontSize: 15,
                            color: Color.fromARGB(255, 107, 113, 119),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 150, // Set the height of the container
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 247, 100, 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "30% OFF DURING \nRamadan",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/images/shopping.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "50% OFF DURING \nVishu",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/images/shopping.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(

                      //     width: MediaQuery.of(context).size.width * 0.7,
                      //     padding: EdgeInsets.all(20),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.blue,
                      //     ),
                      //     child: Text(
                      //       "50% OFF DURING \nVishu",
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         color: Colors.white,
                      //       ),
                      //       textAlign: TextAlign.left,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top categories",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Handle your onTap here.
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Obx(() => ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Categories(
                              categoryName: 'All',
                              isSelected:
                                  controller.selectedCategory.value == 'All',
                              onPressed: (p0) {
                                controller.selectCategory(p0);

                                controller.onReady();
                                Future.delayed(Duration(seconds: 1), () {
                                  controller.onReady();
                                });
                              },
                            ),
                            Categories(
                              categoryName: 'Cotton Candy ',
                              isSelected: controller.selectedCategory.value ==
                                  'Cotton Candy ',
                              onPressed: (p0) {
                                controller.selectCategory(p0);
                                controller.onReady();
                                Future.delayed(Duration(seconds: 1), () {
                                  controller.onReady();
                                });
                              },
                            ),
                            Categories(
                              categoryName: 'Pop Corn ',
                              isSelected: controller.selectedCategory.value ==
                                  'Pop Corn ',
                              onPressed: (p0) {
                                controller.selectCategory(p0);
                                controller.onReady();
                                Future.delayed(Duration(seconds: 1), () {
                                  controller.onReady();
                                });
                              },
                            ),
                            Categories(
                              categoryName: 'Dry Fruits',
                              isSelected: controller.selectedCategory.value ==
                                  'Dry Fruits',
                              onPressed: (p0) {
                                controller.selectCategory(p0);
                                controller.onReady();
                                Future.delayed(Duration(seconds: 1), () {
                                  controller.onReady();
                                });
                              },
                            ),
                            Categories(
                              categoryName: 'Curry Powders',
                              isSelected: controller.selectedCategory.value ==
                                  'Curry Powders',
                              onPressed: (p0) {
                                controller.selectCategory(p0);
                                controller.onReady();
                                Future.delayed(Duration(seconds: 1), () {
                                  controller.onReady();
                                });
                              },
                            ),
                            Categories(
                              categoryName: 'Spices',
                              isSelected:
                                  controller.selectedCategory.value == 'Spices',
                              onPressed: (p0) {
                                controller.selectCategory(p0);
                                controller.onReady();
                                Future.delayed(Duration(seconds: 1), () {
                                  controller.onReady();
                                });
                              },
                            ),
                            Categories(
                              categoryName: 'Kerala Special',
                              isSelected: controller.selectedCategory.value ==
                                  'Kerala Special',
                              onPressed: (p0) {
                                controller.selectCategory(p0);
                                controller.onReady();
                                Future.delayed(Duration(seconds: 1), () {
                                  controller.onReady();
                                });
                              },
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(height: 10),
                StreamBuilder(
                    stream: controller.fetchCustomerProductByCat,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 90, left: 10, right: 10),
                          child: snapshot.data!.products!.isEmpty
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
                                      snapshot.data!.products!.length, (index) {
                                    final a = snapshot.data!.products![index];
                                    // Your code here
                                    return Stack(
                                      children: [
                                        SizedBox(
                                          height:
                                              MediaQuery.of(context).size.width,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(() => DetailPageView(),
                                                  arguments: a.sId.toString());
                                            },
                                            child: StreamBuilder(
                                              stream: controller
                                                  .fetchCustomerProductLikede,
                                              builder: (context, snapshot) {
                                                return ProductCard(
                                                  name: a.name ?? '',
                                                  price: a.price ?? '',
                                                  disprice: a.discount ?? '',
                                                  image: a.image?[0] ?? '',
                                                  onPressed: () async {
                                                    controller
                                                        .onlikeProduct(
                                                            a.sId.toString())
                                                        .then((_) async {
                                                      // Call the uploadImages function to upload the selected images
                                                      await controller
                                                          .fetchCustomerProductLiked();
                                                    });

                                                    print('aaaaaaaaa');
                                                  },
                                                  productId: a.sId.toString(),
                                                  likedId: snapshot
                                                      .data!.likedProducts!,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
