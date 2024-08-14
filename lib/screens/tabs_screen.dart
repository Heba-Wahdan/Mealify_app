import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealify/providers/favorite_provider.dart';
import 'package:mealify/screens/categories_screen.dart';
import 'package:mealify/screens/filters_screen.dart';
import 'package:mealify/screens/meals_screen.dart';
import 'package:mealify/widgets/main_drawer.dart';
import 'package:mealify/providers/filters_provider.dart'; //i should import it to make the filter enum available here in this file

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: ((ctx) => const FiltersScreen()),
        ),
      );
    }
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = "Categories";

    if (selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealProvider);
      activePageTitle = "Your Favorites";
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSetScreen: setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_dining), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
