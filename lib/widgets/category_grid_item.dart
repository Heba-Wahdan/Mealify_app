// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mealify/models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            category.color,
            const Color.fromARGB(255, 83, 81, 81),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
