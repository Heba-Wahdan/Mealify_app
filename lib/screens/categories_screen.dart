import 'package:flutter/material.dart';
import 'package:mealify/data/dummy_data.dart';
import 'package:mealify/models/category_model.dart';
import 'package:mealify/models/meal_model.dart';
import 'package:mealify/screens/meals_screen.dart';
import 'package:mealify/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<MealModel> availableMeals;

  void selectCategory(BuildContext context, CategoryModel category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              selectCategory(context, category);
            },
          )
      ],
    );
  }
}
