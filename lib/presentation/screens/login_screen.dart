import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_router.dart';
import '../../constants/cache_helper.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../constants/variables.dart';
import '../../data/models/auth_models.dart';
import '../../data/web_services/api_service.dart';
import '../../data/web_services/auth_service.dart';
import '../widgets/app_buttons.dart';
import '../widgets/text_field_widget.dart';
import 'home_screen_test.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AppRouter appRouter = AppRouter();

  SharedPreferences? prefs;

  LoginScreen({super.key, this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Image(
                    height: imageHeight,
                    width: imageWidth,
                    image: AssetImage(
                      'assets/images/Book lover-pana.png',
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                const SizedBox(
                  height: sizedBoxHeightSize,
                ),
                MainAppTextField(
                  controller: emailController,
                  textFieldColor: AppColors.textFieldColor,
                  borderColor: AppColors.textFieldColor,
                  text: 'Email',
                  textColor: AppColors.textFieldTextColor,
                  isIcon: true,
                  iconAssetPath: 'assets/icons/icons8-email-24.png',
                  textTypingColor: AppColors.textTypingColor,
                ),
                const SizedBox(
                  height: sizedBoxHeightSize,
                ),
                MainAppTextField(
                  controller: passwordController,
                  onSuffixTap: () {},
                  obscureText: true,
                  textFieldColor: AppColors.textFieldColor,
                  borderColor: AppColors.textFieldColor,
                  text: 'Password',
                  textColor: AppColors.textFieldTextColor,
                  isIcon: true,
                  iconAssetPath: 'assets/icons/icons8-password-24.png',
                  textTypingColor: AppColors.textTypingColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, forgotPasswordV1),
                      child: const Column(
                        children: [
                          Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: AppColors.mainButtonsColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: sizedBoxHeightSize,
                ),
                const SizedBox(
                  height: sizedBoxHeightSize,
                ),
                GestureDetector(
                  onTap: () async {
                    LoginModel data = LoginModel(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    final Either<String, Response> result =
                        await ApiService().signinPostRequest(data.toJson());

                    result.fold(
                      (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                      (response) {
                        // Save access token to SharedPreferences
                        final accessToken = response.data['token'];
                        CacheHelper.saveData('access_token', accessToken);

                        // Handle successful response
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreenTest(),
                          ),
                        );
                      },
                    );
                  },
                  child: MainAppButtons(
                    buttonColor: AppColors.mainButtonsColor,
                    borderColor: AppColors.mainButtonsBorderColor,
                    text: 'Sign in',
                    textColor: AppColors.mainButtonsTextColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, signUpScreen);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: AppColors.mainButtonsColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
