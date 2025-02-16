import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zeph/src/features/auth/controllers/auth_controller.dart';
import 'package:zeph/src/features/auth/pages/signin.dart';
import 'package:zeph/src/features/profile/pages/personal_profile_page.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Obx(() {
      if (authController.user.value != null) {
        return PersonalProfilePage();
      } else {
        return Signin();
      }
    });
  }
}
