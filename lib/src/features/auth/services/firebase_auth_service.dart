import 'package:zeph/src/models/user_model.dart';
import 'package:zeph/src/services/local_storage.dart';

class FirebaseAuthService {
  Future<void> signInUser(String email, String password) async {
    try {
      UserModel user = UserModel.fromMap(dummyUser);
      await LocalStorageService.saveUser(user);
      print('User data saved successfully');
    } catch (e) {
      print(e.toString());
    }
  }
}

Map<String, dynamic> dummyUser = {
  'uid': '123456',
  'email': 'testuser@example.com',
  'password': 'hashed_password', // Store hashed passwords in real cases
  'userName': 'TestUser',
  'profileImage': 'https://example.com/profile.jpg',
  'followers': 150,
  'following': 80,
  'createdAt': DateTime.now().toIso8601String(),
  'postIds': ['post1', 'post2', 'post3'], // Example post IDs
  'friendIds': ['user789', 'user456'], // Example friend user IDs
  'savedPostIds': ['post4', 'post5'], // Example saved posts
  'likedPostIds': ['post2', 'post6'], // Example liked posts
};
