import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class HomeScreenTest extends StatelessWidget {
  const HomeScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: AppColors.highligtedTextColor,
      ),
    );
  }
}
