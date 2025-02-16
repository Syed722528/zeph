import 'package:flutter/material.dart';

class PersonalProfilePage extends StatelessWidget {
  const PersonalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final personalProfilePageController = Get.put(PersonalProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
    );
  }
}
