class UserModel {
  final String uid;
  final String email;
  final String password;
  final String userName;
  final String profileImage;
  final int followers;
  final int following;
  final DateTime createdAt;
  final List<String> postIds;
  final List<String> friendIds;
  final List<String> savedPostIds;
  final List<String> likedPostIds;

  UserModel({
    required this.uid,
    required this.email,
    required this.password,
    required this.userName,
    required this.profileImage,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.postIds,
    required this.friendIds,
    required this.savedPostIds,
    required this.likedPostIds,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      password: map['password'],
      userName: map['userName'],
      profileImage: map['profileImage'],
      followers: map['followers'],
      following: map['following'],
      createdAt: DateTime.parse(map['createdAt']),
      postIds: List<String>.from(map['postIds'] ?? []),
      friendIds: List<String>.from(map['friendIds'] ?? []),
      savedPostIds: List<String>.from(map['savedPostIds'] ?? []),
      likedPostIds: List<String>.from(map['likedPostIds'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'userName': userName,
      'profileImage': profileImage,
      'followers': followers,
      'following': following,
      'createdAt': createdAt.toIso8601String(),
      'postIds': postIds,
      'friendIds': friendIds,
      'savedPostIds': savedPostIds,
      'likedPostIds': likedPostIds,
    };
  }
}
