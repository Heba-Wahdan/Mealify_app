// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSetScreen,
  });

  final void Function(String identifier) onSetScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 45,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "Cooking up!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSetScreen(
                "Meals",
              );
            },
            leading: const Icon(
              Icons.fastfood,
              size: 35,
            ),
            title: const Text(
              "Meals",
              style: TextStyle(fontSize: 19),
            ),
          ),
          ListTile(
            onTap: () {
              onSetScreen("filters");
            },
            leading: const Icon(
              Icons.settings,
              size: 35,
            ),
            title: const Text(
              "Filters",
              style: TextStyle(fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
