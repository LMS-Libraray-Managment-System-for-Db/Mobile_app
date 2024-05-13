import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:library_management_system/presentation/widgets/drop_down_widget.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../constants/variables.dart';
import '../../data/models/auth_models.dart';
import '../../data/web_services/auth_service.dart';
import '../widgets/app_buttons.dart';
import '../widgets/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String? selectedRole;

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
                    height: 350,
                    width: 400,
                    image: AssetImage(
                      'assets/images/Book lover-bro.png',
                    )),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Create New Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                MainAppTextField(
                  controller: userNameController,
                  textFieldColor: AppColors.textFieldColor,
                  borderColor: AppColors.textFieldColor,
                  text: 'Username',
                  textColor: AppColors.textFieldTextColor,
                  textTypingColor: AppColors.textTypingColor,
                  isIcon: true,
                  defaultIcon: Icons.person_outline_rounded,
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
                  height: sizedBoxHeightSize,
                ),
                MainAppTextField(
                  onSuffixTap: () {},
                  obscureText: true,
                  textFieldColor: AppColors.textFieldColor,
                  borderColor: AppColors.textFieldColor,
                  text: 'Confirm Password',
                  textColor: AppColors.textFieldTextColor,
                  isIcon: true,
                  iconAssetPath: 'assets/icons/icons8-password-24.png',
                  textTypingColor: AppColors.textTypingColor,
                ),
                const SizedBox(
                  height: sizedBoxHeightSize,
                ),
                CustomDropdown(
                  textFieldColor: AppColors.textFieldColor,
                  borderColor: AppColors.mainButtonsColor,
                  text: 'Select your role',
                  textColor: AppColors.textFieldTextColor,
                  textTypingColor: AppColors.textFieldTextColor,
                  items: const ['Student', 'Librarian', 'Admin'],
                  value: selectedRole,
                  onChanged: (newValue) {
                    setState(() {
                      selectedRole = newValue;
                    });
                    log('$selectedRole');
                  },
                ),
                const SizedBox(
                  height: sizedBoxHeightSize * 2,
                ),
                GestureDetector(
                  onTap: () {
                    SignupModel data = SignupModel(
                      userName: userNameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    ApiServices().signupPostRequest(data);
                  },
                  child: MainAppButtons(
                    buttonColor: AppColors.mainButtonsColor,
                    borderColor: AppColors.mainButtonsBorderColor,
                    text: 'Sign Up',
                    textColor: AppColors.mainButtonsTextColor,
                  ),
                ),
                const SizedBox(
                  height: sizedBoxHeightSize,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, loginScreen);
                      },
                      child: const Text(
                        "Sign In",
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
