import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/home_screen/cubit/categories_state.dart';
import 'package:e_commerce/features/home_screen/models/categories_model.dart';
import 'package:e_commerce/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(CategoriesInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());

    final Either<String, List<CategoriesModel>> res = await _homeRepo
        .getCategories();

    res.fold(
      (error) {
        emit(CategoriesError(error));
      },
      (categories) {
        emit(CategoriesLoaded(categories));
      },
    );
  }
}
