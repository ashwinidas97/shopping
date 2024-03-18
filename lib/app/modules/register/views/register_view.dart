import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping/app/modules/login/views/login_view.dart';
import 'package:shopping/app/widgets/button.dart';
import 'package:shopping/app/widgets/edit_text.dart';
import 'package:shopping/app/widgets/heading_text.dart';
import 'package:shopping/app/widgets/password_edit_text.dart';
import 'package:shopping/app/widgets/text_view.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
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
                  // Add the missing image here
                  Image.asset(
                    'assets/images/Laptop.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 469,
                  ),

                  Positioned(
                    left: 0,
                    top: 260,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 80,
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
                          HeadingText(text: 'Register Now', marginTop: 45),
                          EditText(
                            text: 'Enter Full Name',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: controller.fname,
                          ),
                          EditText(
                            text: 'Enter Email',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: controller.email,
                          ),
                          // Use PasswordEditText widget for password input
                          PasswordEditText(
                            text: 'Enter Password',
                            textInputType: TextInputType.visiblePassword,
                            textEditingController: controller.password,
                            onChange: (value) {
                              controller.password.value =
                                  TextEditingValue(text: value);
                              controller.validateConfirmPassword();
                            },
                          ),
                          PasswordEditText(
                            text: 'Re Enter Password',
                            textInputType: TextInputType.visiblePassword,
                            textEditingController: controller.repassword,
                            onChange: (value) {
                              controller.repassword.value =
                                  TextEditingValue(text: value);
                              controller.validateConfirmPassword();
                            },
                          ),
                          Obx(() {
                            if (!controller.isPasswordValid.value) {
                              return SizedBox(
                                  width: 320,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HeadingText(
                                        text: '\u26A0 Password Incorrect.',
                                      ),
                                    ],
                                  ));
                            } else {
                              return const SizedBox.shrink();
                            }
                          }),
                          Button(
                            text: 'Register Now',
                            onClick: () {
                              controller.onRegisterClick(context);
                            },
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              Get.to(LoginView());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextView(
                                  text: 'Already have an account ',
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                                TextView(
                                  text: ' Login Now',
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
