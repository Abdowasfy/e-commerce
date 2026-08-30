import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/styling/app_colors.dart';
import 'package:e_commerce/core/styling/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/features/home_screen/cubit/categories_cubit.dart';
import 'package:e_commerce/features/home_screen/cubit/categories_state.dart';
import 'package:e_commerce/features/home_screen/cubit/product_cubit.dart';
import 'package:e_commerce/features/home_screen/cubit/product_state.dart';
import 'package:e_commerce/features/home_screen/models/products_model.dart';
import 'package:e_commerce/features/home_screen/widgets/category_item_widget.dart';
import 'package:e_commerce/features/home_screen/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "";

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProducts();
    context.read<CategoriesCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(59),

          SizedBox(
            width: 335.w,
            child: Text("Discover", style: AppStyles.black18boldStyle),
          ),
          Gap(16),
          Row(
            children: [
              CustomTextField(width: 281.w, hintText: "Search for clothes..."),
              const Gap(8),
              Container(
                width: 52.w,
                height: 52.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
          const Gap(16),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.categories.map((cat) {
                      return CategoryItemWidget(
                        categoryName: cat.name ?? "",
                        isSelected: selectedCategory == cat.name ? true : false,
                        onpress: () {
                          setState(() {
                            selectedCategory = cat.name ?? "";
                          });
                          context.read<ProductCubit>().fetchProductsByCategory(
                           cat.id as int,
                          );
                        },
                      );
                    }).toList(),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
          const Gap(16),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return LoadingWidget(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                );
              }
              if (state is ProductLoaded) {
                List<ProductsModel> products = state.products;
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.whiteColor,
                    //displacement: 100,
                    onRefresh: () async {
                      selectedCategory = "";
                      setState(() {});
                      context.read<ProductCubit>().fetchProducts();
                    },
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 16.0,
                            childAspectRatio: 0.7,
                          ),
                      children: products.map((product) {
                        return ProductItemWidget(
                          image: product.images.first,
                          title: product.title,
                          price: product.price.toString(),
                          onTap: () {
                            GoRouter.of(context).push(AppRoutes.productScreen,extra: product);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
              }
              return Text("this is an error");
            },
          ),
        ],
      ),
    );
  }
}
