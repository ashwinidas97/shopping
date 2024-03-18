import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping/app/modules/register/views/register_view.dart';
import 'package:shopping/app/widgets/button.dart';
import 'package:shopping/app/widgets/edit_text.dart';
import 'package:shopping/app/widgets/heading_text.dart';
import 'package:shopping/app/widgets/password_edit_text.dart';
import 'package:shopping/app/widgets/text_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 844,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(19),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      'assets/images/Laptop.png',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 469,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 439,
                    child: Container(
                      height: 440,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          HeadingText(text: 'Login Now', marginTop: 45),
                          EditText(
                            text: 'Enter Email',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: controller.email,
                          ),
                          PasswordEditText(
                            text: 'Enter Password',
                            textInputType: TextInputType.visiblePassword,
                            textEditingController: controller.password,
                          ),
                          Button(
                            text: 'Login Now',
                            onClick: () {
                              controller.onLoginCLick(context);
                            },
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              Get.to(RegisterView());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextView(
                                  text: 'Don\'t have an account ',
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                                TextView(
                                  text: ' Register Now',
                                  fontSize: 13,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
