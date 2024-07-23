
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoritesMealNotifier extends StateNotifier<List<Meal>>{
  FavoritesMealNotifier() : super([]);

  bool toggleMealFavoritesStatus(Meal meal) {
    final isMealFavorites = state.contains(meal);
    if(isMealFavorites) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}
final favoritesMealProvider = StateNotifierProvider<FavoritesMealNotifier, List<Meal>>((ref) {
  return FavoritesMealNotifier();
});