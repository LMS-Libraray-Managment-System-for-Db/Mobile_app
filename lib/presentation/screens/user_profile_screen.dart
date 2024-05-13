import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class UserProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userProfile;

  const UserProfileScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    // Use userProfile data to display user profile information
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.highligtedTextColor,
      ),
      body: Center(
        child: Text(userProfile.toString()),
      ),
    );
  }
}
