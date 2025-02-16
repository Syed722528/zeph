import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeph/src/features/auth/controllers/signin_controller.dart';
import 'package:zeph/src/features/auth/pages/signup.dart';

import '../../../utils/app_colors.dart';
import '../widgets/custom_input_decoration.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final signinController = Get.put(SignInController());
    Future.delayed(Duration(seconds: 1), () => signinController.showForm());
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
              duration: Duration(seconds: 1),
              curve: Curves.easeInCubic,
              left: 0,
              right: 0,
              bottom: signinController.bottomPosition.value,
              child: Container(
                padding: EdgeInsets.all(40),
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(60.0),
                  ),
                  color: AppColors.backgroundOffWhite,
                ),
                child: Form(
                  key: signinController.formKey,
                  child: Column(
                    spacing: 30,
                    children: [
                      SizedBox(
                        width: Get.width * 0.75,
                        child: TextFormField(
                          validator:
                              (value) => signinController.validateEmail(value),
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
                                  signinController.validatePassword(value),
                          decoration: AuthInputDecorations.inputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      Text(
                        'F O R G O T   P A S S W O R D',
                        style: TextStyle(color: AppColors.accentDark),
                      ),
                      GestureDetector(
                        onTap: () => signinController.signIn(),
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
                            'LOG IN',
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
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => SignUp());
                            },
                            child: Text(
                              'SIGN UP',
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
        ],
      ),
    );
  }
}
