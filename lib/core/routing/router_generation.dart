import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/account/account_screen.dart';
import 'package:e_commerce/features/address/address_screen.dart';
import 'package:e_commerce/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/loginScreen/login_screen.dart';
import 'package:e_commerce/features/auth/registerScreen/register_screen.dart';
import 'package:e_commerce/features/cart/cart_screen.dart';
import 'package:e_commerce/features/home_screen/models/products_model.dart';
import 'package:e_commerce/features/main_screen/main_screen.dart';
import 'package:e_commerce/features/product_screen/product_screen.dart';
import 'package:e_commerce/features/splash_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGeneration {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        name: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.mainscreen,
        name: AppRoutes.mainscreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: AppRoutes.productScreen,
        name: AppRoutes.productScreen,
        builder: (context, state) {
          ProductsModel product = state.extra as ProductsModel;
          return ProductScreen(product: product);
        },
      ),
      GoRoute(
        path: AppRoutes.cartScreen,
        name: AppRoutes.cartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: AppRoutes.accountScreen,
        name: AppRoutes.accountScreen,
        builder: (context, state) => const AccountScreen(),
      ),
      GoRoute(
        path: AppRoutes.addressScreen,
        name: AppRoutes.addressScreen,
        builder: (context, state) => const AddressScreen(),
      ),
    ],
  );
}
