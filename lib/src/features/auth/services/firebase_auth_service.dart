import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/user_model.dart';

class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        DocumentSnapshot userDoc =
            await _firestore
                .collection('users')
                .doc(userCredential.user!.uid)
                .get();
        if (userDoc.exists) {
          return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  static Future<UserModel?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        UserModel user = UserModel(
          uid: userCredential.user!.uid,
          email: email,
          password: password,
          userName: 'guestUser',
          profileImage:
              'https://www.lremanagementllc.com/wp-content/uploads/2019/06/default-avatar.png',
          followers: 0,
          following: 0,
          createdAt: DateTime.now(),
          postIds: [],
          friendIds: [],
          savedPostIds: [],
          likedPostIds: [],
        );

        _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toMap());
        return user;
      }
    } catch (e) {
      print('$e');
      throw Exception(e.toString());
      
    }
    return null;
  }
}


