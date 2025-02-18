import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zeph/src/features/auth/services/firebase_auth_service.dart';
import 'package:zeph/src/services/local_storage.dart';

import '../../../models/user_model.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxDouble bottomPosition = (-Get.height * 0.70).obs;

  void showForm() {
    bottomPosition.value = 0; // Slide up
  }

  void hideForm() {
    bottomPosition.value = -Get.height * 0.70; // Slide down
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    hideForm();
    super.onClose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!GetUtils.isEmail(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        UserModel? user = await FirebaseAuthService.signIn(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        if (user != null) {
          LocalStorageService.saveUser(user);
          Get.snackbar('Success', 'Sign in Successful');
        } else {
          Get.snackbar('Error', 'Invalid Credentials');
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
