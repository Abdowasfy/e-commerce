import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/account/account_screen.dart';
import 'package:e_commerce/features/cart/cart_screen.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home_screen/cubit/categories_cubit.dart';
import 'package:e_commerce/features/home_screen/cubit/product_cubit.dart';
import 'package:e_commerce/features/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductCubit>(),
        ),

        BlocProvider(
          create: (context) => sl<CategoriesCubit>(),
        ),

        BlocProvider.value(
          value: sl<CartCubit>(),
        ),
      ],
      child: Scaffold(
        body: pages[currentIndex],

        bottomNavigationBar: Container(
          color: AppColors.whiteColor,
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 10.h,
            bottom: 18.h,
          ),
          child: GNav(
            selectedIndex: currentIndex,

            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            color: AppColors.greyColor,

            activeColor: AppColors.primaryColor,

            tabBackgroundColor:
                AppColors.primaryColor.withValues(alpha: 0.1),

            gap: 8.w,

            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),

            duration: const Duration(milliseconds: 300),

            tabs: [
              GButton(
                icon: currentIndex == 0
                    ? Icons.home
                    : Icons.home_outlined,
                text: 'Home',
                iconSize: 24.sp,
              ),

              GButton(
                icon: currentIndex == 1
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                text: 'Cart',
                iconSize: 24.sp,
              ),

              GButton(
                icon: currentIndex == 2
                    ? Icons.account_circle
                    : Icons.account_circle_outlined,
                text: 'Account',
                iconSize: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
