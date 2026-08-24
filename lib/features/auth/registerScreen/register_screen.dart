import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool isPasswordHidden = true;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
                    "Create an account",
                    style: AppStyles.black18boldStyle,
                  ),
                ),
                Gap(8),
                Text(
                  "Let’s create your account.",
                  style: AppStyles.subtitleStyle,
                ),
                const Gap(32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Full Name", style: AppStyles.black16w500style),
                ),
                Gap(5),
                CustomTextField(
                  controller: nameController,
                  hintText: "Enter your full name",
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
                const Gap(42),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm Password",
                    style: AppStyles.black16w500style,
                  ),
                ),
                Gap(5),
                CustomTextField(
                  controller: confirmPasswordController,
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
                  buttonText: "Create Account",
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      print(nameController.text);
                      print(emailController.text);
                      print(passwordController.text);
                      print(confirmPasswordController.text);
                      // GoRouter.of(context).push(AppRoutes.mainscreen);
                    }
                  },
                ),

                const Gap(110),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: AppStyles.black15BoldStyle.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRoutes.loginScreen);
                        },
                        child: Text(
                          "Log In",
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
