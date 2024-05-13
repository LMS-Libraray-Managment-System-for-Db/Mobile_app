import 'package:flutter/material.dart';
import 'package:library_management_system/constants/cache_helper.dart';
import 'package:library_management_system/data/web_services/api_service.dart';
import 'package:library_management_system/presentation/widgets/app_buttons.dart';

import '../../constants/colors.dart';
import 'user_profile_screen.dart';

// ignore: must_be_immutable
class HomeScreenTest extends StatelessWidget {
  HomeScreenTest({super.key});
  String? token = CacheHelper.getToken('access_token');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Home Screen',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.highligtedTextColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('User Token is:'),
              const SizedBox(
                height: 10,
              ),
              Text('$token'),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  // get user profile request
                  final response = await ApiService().getUserProfile(token!);
                  // navigate to another screen to show the data of the user

                  response.fold(
                    (error) {
                      // Handle error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                    (profileResponse) {
                      // Navigate to another screen to show the data of the user
                      if (profileResponse.statusCode == 200) {
                        // Success: Navigate to UserProfileScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfileScreen(
                              userProfile: profileResponse.data,
                            ),
                          ),
                        );
                      } else {
                        // Handle other status codes (e.g., 401 Unauthorized)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to fetch user profile.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  );
                },
                child: MainAppButtons(
                    widthSize: double.infinity,
                    textColor: Colors.white,
                    buttonColor: AppColors.mainButtonsColor,
                    borderColor: AppColors.mainButtonsColor,
                    text: 'Click Me to show profile!'),
              )
            ],
          )),
        ));
  }
}
