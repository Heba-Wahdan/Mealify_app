import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealify/models/meal_model.dart';

class FavoriteMealNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealNotifier() : super([]); //first initialize the variable

  bool toggleMealFavoriteStatus(MealModel meal) {
    //second make the function
    final mealIsFavorite =
        state.contains(meal); //to access the variable I use state

    if (mealIsFavorite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); // I can't edit the state variable, I have always to assign it to new variable
      return false;
    } else {
      state = [
        ...state,
        meal
      ]; //it copies all the list in the state (...state) and add the new meal to it (and assign them to a new variable called state)
      return true;
    }
  }
}

// now I need to connect to the actual provider, so I can use this data in my widgets
final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<MealModel>>((ref) {
  return FavoriteMealNotifier();
}); //to connect them I need to return an instance of the notifier class
//it does understand that it returns favoriteMealNotifier, but it does not understand unfortunately which date the favoriteMealNotifier will yield in the end,
// so I should add angled brackets and pass 2 generic types the first one is the notifier(favoriteMealNotifier) and the second one is the data type

