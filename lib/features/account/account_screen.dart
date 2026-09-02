import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/styling/app_assets.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widgets/primary_button_widget.dart';
import 'package:e_commerce/features/account/widgets/account_item_widgets.dart';
import 'package:e_commerce/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Account", style: TextStyle(fontSize: 25)),
        centerTitle: true,
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(),
            ),
            const Gap(16),
            const AccountItemWidgets(
              title: "My Orders",
              iconPath: AppAssets.box,
            ),
            const Gap(25),
            Divider(thickness: 9, height: 8, color: Color(0xffAAAAAA)),
            const Gap(64),
            const AccountItemWidgets(
              title: "My Details",
              iconPath: AppAssets.details,
              //onTap: (){},
            ),
            const Gap(25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(),
            ),
            const Gap(25),

            AccountItemWidgets(
              title: "Address Book",
              iconPath: AppAssets.address,
              onTap: () {
                GoRouter.of(context).push(AppRoutes.addressScreen);
              },
            ),
            const Gap(25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(),
            ),
            const Gap(25),
            const AccountItemWidgets(
              title: "FAQs",
              iconPath: AppAssets.question,
            ),
            const Gap(25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(),
            ),
            const Gap(25),
            const AccountItemWidgets(
              title: "Help Center",
              iconPath: AppAssets.help,
            ),
            const Gap(25),
            Divider(thickness: 9, height: 8, color: Color(0xffE6E6E6)),
            const Gap(170),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: InkWell(
                onTap: () {
                  showLogOutDialog(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.redAccent, size: 25.sp),
                    const Gap(8),
                    Text(
                      "Logout",
                      style: AppStyles.black15BoldStyle.copyWith(
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLogOutDialog(BuildContext parentContext) {
    showDialog(
      context: parentContext,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: SizedBox(
            height: 350.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 65.sp),
                  const Gap(15),
                  Text(
                    "Logout?",
                    style: AppStyles.primaryMeadLineStyle.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    "Are you sure you want to logout?",
                    style: AppStyles.grey12wMediumStyle,
                  ),
                  const Gap(24),
                  PrimayButtonWidget(
                    buttonColor: Colors.red,
                    buttonText: "Yes, Logout",
                    onPress: () {
                      parentContext.read<AuthCubit>().Logout();
                      GoRouter.of(parentContext).push(AppRoutes.loginScreen);
                    },
                  ),
                  const Gap(12),
                  PrimayButtonWidget(
                    buttonColor: Colors.white,
                    buttonText: "No, Cancel",
                    onPress: () {
                      context.pop();
                    },
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
