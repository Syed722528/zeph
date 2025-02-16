import 'package:get/get.dart';
import 'package:zeph/src/models/user_model.dart';
import 'package:zeph/src/services/local_storage.dart';

class AuthController extends GetxController {
  Rx<UserModel?> user = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() async {
    user.value = await LocalStorageService.getUser();
  }
}
