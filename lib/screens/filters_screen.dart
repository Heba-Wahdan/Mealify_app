// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealify/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[
                Filters.glutenFree]!, // Current state of the switch
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.glutenFree, isChecked);
            },
            title: const Text(
              "Gluten-Free",
              style: TextStyle(fontSize: 19),
            ),
            subtitle: const Text("Includes only gluten free meals"),
            activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.lactoseFree, isChecked);
            },
            title: const Text(
              "lactose-Free",
              style: TextStyle(fontSize: 19),
            ),
            subtitle: const Text("Includes only lactose free meals"),
            activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegetarian, isChecked);
            },
            title: const Text(
              "Vegetarian",
              style: TextStyle(fontSize: 19),
            ),
            subtitle: const Text("Includes only vegetarian free meals"),
            activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegan, isChecked);
            },
            title: const Text(
              "Vegan",
              style: TextStyle(fontSize: 19),
            ),
            subtitle: const Text("Includes only vegan free meals"),
            activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
