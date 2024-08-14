import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealItemTrait extends StatelessWidget {
  final IconData icon;
  final String label;

  const MealItemTrait({super.key, required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 17,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
