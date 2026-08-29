import 'package:e_commerce/core/routing/router_generation.dart';
import 'package:e_commerce/core/styling/theme_data.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce',
          theme: AppTheme.lightTheme,
          routerConfig: RouterGeneration.goRouter,
        );
      },
    );
  }
}
