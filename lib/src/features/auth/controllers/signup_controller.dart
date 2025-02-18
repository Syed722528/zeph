import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zeph/src/features/auth/services/firebase_auth_service.dart';
import 'package:zeph/src/services/local_storage.dart';

import '../../../models/user_model.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
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
    confirmPassword.dispose();
    super.onClose();
  }

  // Validation logic
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm your password";
    } else if (passwordController.text != confirmPassword.text) {
      return 'Passwords do not match';
    }
    // //  else if (value != passwordController.text) {
    // //   return "Passwords do not match";
    // }
    return null;
  }

  void signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        UserModel? user = await FirebaseAuthService.signUp(
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        if (user != null) {
          LocalStorageService.saveUser(user);
          Get.snackbar('Success', 'Account created successfully');
        } else {
          Get.snackbar('Error', 'An unknown error occurred');
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
