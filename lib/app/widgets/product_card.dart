import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/app/data/colors.dart';
import 'package:shopping/app/modules/home/controllers/home_controller.dart';
import 'package:shopping/app/networks/network_model/res/customer_product_like.dart';
//import 'package:shopping/app/widgets/favorite_icon.dart';
import 'package:shopping/app/widgets/offer_card.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String disprice;
  final String image;
  final String productId;
  final List likedId;

  final Function onPressed;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.disprice,
    required this.image,
    required this.onPressed,
    required this.productId,
    required this.likedId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    print(likedId);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.width > 600 ? 50 : 70,
              right: MediaQuery.of(context).size.width > 600 ? 0 : 0,
              left: MediaQuery.of(context).size.width > 600 ? 0 : 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width > 600 ? 300 : 150,
                  width: MediaQuery.of(context).size.height > 600 ? 300 : 140,
                  child: Image.network(
                    image,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: OfferCard(),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  likedId.any((product) =>
                          product.productId.toString() == productId)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  productId.isNotEmpty
                      ? controller.onUnlikeClick(
                          productId) // If already liked, unlike it
                      : null;
                  productId.isNotEmpty
                      ? controller.onlikeProduct(productId)
                      : null;
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width > 600 ? 250 : 220,
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    color: AppColor.white,
                  ),
                  height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColor.darkBlue,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              disprice,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: AppColor.black,
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              price,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w100,
                                fontSize: 13,
                                color: AppColor.darkBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 100,
//         width: 100,
//         decoration: BoxDecoration(
//           color: AppColor.blue,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Center(
//             child: Stack(
//           children: [
//             Positioned(
//               top: MediaQuery.of(context).size.width > 600 ? 50 : 70,
//               right: MediaQuery.of(context).size.width > 600 ? 0 : 0,
//               left: MediaQuery.of(context).size.width > 600 ? 0 : 4,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8, right: 8),
//                 child: SizedBox(
//                   height: MediaQuery.of(context).size.width > 600 ? 300 : 150,
//                   width: MediaQuery.of(context).size.height > 600 ? 300 : 140,
//                   child: Image.network(
//                     'data:image/jpeg;base64,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',
//                     alignment: Alignment.center,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 10,
//               left: 10,
//               child: OfferCard(),
//             ),
//             Positioned(
//               top: 10,
//               right: 10,
//               child: FavoriteIcon(id: Id,),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.width > 600 ? 250 : 220,
//               bottom: 0,
//               right: 0,
//               left: 0,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.vertical(
//                       bottom: Radius.circular(20),
//                     ),
//                     color: AppColor.white,
//                   ),
//                   height: 80,
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Product Name',
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18,
//                             color: AppColor.darkBlue,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               '₹300',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 16,
//                                 color: AppColor.black,
//                               ),
//                             ),
//                             SizedBox(width: 3),
//                             Text(
//                               '₹300',
//                               style: TextStyle(
//                                 decoration: TextDecoration.lineThrough,
//                                 fontWeight: FontWeight.w100,
//                                 fontSize: 13,
//                                 color: AppColor.darkBlue,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }