import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('The no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var meal = favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
