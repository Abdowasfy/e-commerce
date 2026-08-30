import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/account/account_screen.dart';
import 'package:e_commerce/features/cart/cart_screen.dart';
import 'package:e_commerce/features/home_screen/cubit/categories_cubit.dart';
import 'package:e_commerce/features/home_screen/cubit/product_cubit.dart';
import 'package:e_commerce/features/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProductCubit>()),
        BlocProvider(create: (context) => sl<CategoriesCubit>()),
      ],
      child: const HomeScreen(),
    ),
    const CartScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 5,

        type: BottomNavigationBarType.fixed,

        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,

        currentIndex: currentIndex,

        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 24.sp),
            activeIcon: Icon(Icons.home, size: 24.sp),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, size: 24.sp),
            activeIcon: Icon(Icons.shopping_cart, size: 24.sp),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined, size: 24.sp),
            activeIcon: Icon(Icons.account_circle, size: 24.sp),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
