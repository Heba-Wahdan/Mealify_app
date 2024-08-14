import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealify/providers/meals_provider.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false
        });

  void setFilters(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {
      ...state,
      filter: isActive
    }; //it will copy the existing map (...state) and will only update one key to a new value isActive, so it will override the key value
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final dummyMeals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return dummyMeals.where((meal) {
    if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }

    if (activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }

    if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }

    if (activeFilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
