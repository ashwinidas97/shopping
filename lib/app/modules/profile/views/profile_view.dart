import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping/app/modules/cart/views/cart_view.dart';
import 'package:shopping/app/modules/favorite/views/favorite_view.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            'My Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold
              ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('data:image/jpeg;base64,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'), // Replace with user's image URL
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name', 
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'user@gmail.com', 
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.shopping_cart_checkout),
              title: Text('My Cart'),
              onTap: () {
               Get.to(() => CartView());
              }, // Implement navigation
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('My Wishlist'),
              onTap: () {
                Get.to(() => FavoriteView());
              }, // Implement navigation
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Shipping Address'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Shipping Address'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Address',
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Pin Code',
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'District',
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'State',
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Country',
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Submit'),
                          onPressed: () {
                            // Implement your logic here
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Edit'),
                          onPressed: () {
                            // Implement your logic here
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }, // Implement navigation
            ),
            // ListTile(
            //   leading: Icon(Icons.payment),
            //   title: Text('Payment Methods'),
            //   onTap: () {}, // Implement navigation
            // ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {}, // Implement navigation
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {}, // Implement navigation
            ),
          ],
        ),
      ),
    );
  }
}
