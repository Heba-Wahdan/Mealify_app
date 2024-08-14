// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealify/models/meal_model.dart';
import 'package:mealify/providers/favorite_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  final MealModel meal;

  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //in statelessWidget(ConsumerWidget) it's different, we do not have ref property unlike the ConsumerState in the ConsumerStatefulWidget which made ref property globally available
    final favoriteMeals = ref.watch(favoriteMealProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealProvider
                        .notifier) // i can not use watch here
                    .toggleMealFavoriteStatus(
                        meal); // now I can trigger the function not only get the data List
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasAdded
                        ? "Meal is added to Favorite"
                        : "Meal is removed from Favorite")));
              },
              icon: Icon(isFavorite ? Icons.star : Icons.star_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(
              height: 14,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                    ),
              ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
