import 'package:e_commerce/core/networking/api_helper.dart';
import 'package:e_commerce/core/utils/storage_helper.dart';
import 'package:e_commerce/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/repo/auth_repo.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home_screen/cubit/categories_cubit.dart';
import 'package:e_commerce/features/home_screen/cubit/product_cubit.dart';
import 'package:e_commerce/features/home_screen/repo/home_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();

  // Dio Helper
  sl.registerSingleton<DioHelper>(dio);

  // Storage Helper
  sl.registerLazySingleton<StorageHelper>(() => StorageHelper());

  // Repos
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepo(sl<DioHelper>()),
  );

  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepo(sl<DioHelper>()),
  );

  // Cubits
  sl.registerFactory(
    () => AuthCubit(sl<AuthRepo>()),
  );
   // Categories Cubit
  sl.registerFactory(
    () => CategoriesCubit(sl<HomeRepo>()),
  );
   // Product Cubit
  sl.registerFactory(
    () => ProductCubit(sl<HomeRepo>()),
  );

  // Cart Cubit
  sl.registerLazySingleton<CartCubit>(
    () => CartCubit(),
  );
}