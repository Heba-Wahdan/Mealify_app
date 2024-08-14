import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mealify/models/meal_model.dart';
import 'package:mealify/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
// this code is wrong: final List<MealModel> meal;
  final MealModel meal; // Accept a single MealModel, not a list

  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  final void Function(MealModel meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    meal.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const SizedBox(width: 25),
                  MealItemTrait(
                      icon: Icons.schedule, label: "${meal.duration} min"),
                  MealItemTrait(icon: Icons.work, label: complexityText),
                  MealItemTrait(
                      icon: Icons.attach_money, label: affordabilityText)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
