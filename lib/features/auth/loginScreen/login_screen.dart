import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isPasswordHidden = true;
 

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(59),

                SizedBox(
                  width: 335.w,
                  child: Text(
                    "Login to your account",
                    style: AppStyles.black18boldStyle,
                  ),
                ),
                Gap(15),
                Text(
                  "It’s great to see you again.",
                  style: AppStyles.subtitleStyle,
                ),

                const Gap(32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("User Name", style: AppStyles.black16w500style),
                ),
                Gap(5),
                CustomTextField(
                  controller: emailController,
                  hintText: "Enter your email address",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Email Address";
                    }
                    return null;
                  },
                ),
                const Gap(16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password", style: AppStyles.black16w500style),
                ),
                Gap(5),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                  isPassword: isPasswordHidden,

                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),

                const Gap(55),
                PrimayButtonWidget(
                  buttonText: "Sign In",
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);
                       GoRouter.of(context).push(AppRoutes.mainscreen);
                    }
                  },
                ),

                const Gap(340),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: AppStyles.black15BoldStyle.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRoutes.registerScreen);
                        },
                        child: Text(
                          "Join",
                          style: AppStyles.black15BoldStyle.copyWith(
                            color: AppColors.balckColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
