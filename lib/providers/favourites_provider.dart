import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/models/meal.dart';

var favouriteMealsProvider =
    StateNotifierProvider<_FavouriteMealsNotifier, List<Meal>>((ref) {
      return _FavouriteMealsNotifier();
    });

class _FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  _FavouriteMealsNotifier() : super([]); // pass initial data to super

  bool toggleMealFavouriteStatus(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return true;
    } else {
      state = [...state, meal];
      return false;
    }
  }
}
