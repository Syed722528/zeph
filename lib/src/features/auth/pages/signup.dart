import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeph/src/features/auth/pages/signin.dart';

import '../../../utils/app_colors.dart';
import '../controllers/signup_controller.dart';
import '../widgets/custom_input_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignUpController());
    Future.delayed(Duration(seconds: 1), () => signupController.showForm());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/auth_bg.jpg', fit: BoxFit.cover),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),
          Positioned(
            top: Get.height * 0.07,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Zeph',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 70,
                    letterSpacing: 8,

                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    decorationStyle: TextDecorationStyle.double,
                    fontSize: 30,
                    color: AppColors.backgroundOffWhite,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              curve: Curves.easeIn,
              duration: Duration(seconds: 1),
              left: 0,
              right: 0,
              // bottom: 0,
              bottom: signupController.bottomPosition.value,
              child: Container(
                padding: EdgeInsets.all(40),
                height: Get.height * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(60.0),
                  ),
                  color: AppColors.backgroundOffWhite,
                ),
                child: Form(
                  key: signupController.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 30,
                      children: [
                        SizedBox(
                          width: Get.width * 0.75,
                          child: TextFormField(
                            validator:
                                (value) =>
                                    signupController.validateEmail(value),
                            decoration: AuthInputDecorations.inputDecoration(
                              hintText: 'Email',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.75,
                          child: TextFormField(
                            validator:
                                (value) =>
                                    signupController.validatePassword(value),
                            decoration: AuthInputDecorations.inputDecoration(
                              hintText: 'Password',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.75,
                          child: TextFormField(
                            validator:
                                (value) => signupController
                                    .validateConfirmPassword(value),
                            decoration: AuthInputDecorations.inputDecoration(
                              hintText: 'Confirm Password',
                            ),
                          ),
                        ),
                        Text(
                          'F O R G O T   P A S S W O R D',
                          style: TextStyle(color: AppColors.accentDark),
                        ),
                        GestureDetector(
                          onTap: () => signupController.signUp(),
                          child: Container(
                            width: Get.width * 0.60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.accentDark,
                                  AppColors.accentLight,
                                ],
                                begin: Alignment.topLeft,
                              ),
                              color: AppColors.accentDark,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: AppColors.backgroundOffWhite,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Text('OR LOG IN BY'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.accentLight,
                              child: Icon(
                                Icons.facebook,
                                color: AppColors.accentDark,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Get.offAll(() => Signin());
                              },
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                  color: AppColors.accentDark,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
