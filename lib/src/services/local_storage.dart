import 'package:hive_flutter/hive_flutter.dart';
import 'package:zeph/src/models/user_model.dart';

class LocalStorageService {
  static Future<void> saveUser(UserModel user) async {
    var box = await Hive.openBox<UserModel>('userBox');

    await box.put('user', user);
  }

  static Future<UserModel?> getUser() async {
    var box = await Hive.openBox<UserModel>('userBox');
    return box.get('user');
  }

  static Future<void> clearUser() async {
    var box = await Hive.openBox<UserModel>('userBox');
    await box.delete('user');
  }
}




