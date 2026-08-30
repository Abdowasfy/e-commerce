import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/styling/app_assets.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/core/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    )..repeat(reverse: true);

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    waitAnimationNavigate();
  }

 void waitAnimationNavigate() async {
    final duration = const Duration(seconds: 3);

    await Future.delayed(duration);

    sl<StorageHelper>().getToken().then((value) {
      if (value == null && value!.isEmpty) {
        context.pushReplacement(AppRoutes.mainscreen);
      } else {
        context.pushReplacement(AppRoutes.loginScreen);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(
            AppAssets.logo,
            width: 200.w,
            height: 200.h,
          ),
        ),
      ),
    );
  }
}