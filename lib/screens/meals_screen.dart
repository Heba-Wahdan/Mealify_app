// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mealify/models/meal_model.dart';
import 'package:mealify/screens/meal_details_screen.dart';
import 'package:mealify/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<MealModel> meals;

  // final CategoryModel category;

  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  void selectMeal(BuildContext context, MealModel meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealDetailsScreen(
        meal: meal,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              onSelectMeal: (meal) {
                selectMeal(context, meal);
              },
              meal: meals[index], // INDEX is important do not forget it again
            );
          });
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
