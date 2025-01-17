import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals
  });

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    //Navigator.push(context, route);
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx)=>
        MealDetailScreen(meal: meal)
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index)=>
            MealItem(meal: meals[index], onSelectMeal: () {
              _selectMeal(context, meals[index]);
            },)
    );
    if (meals.isEmpty) {
      content = Center(
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
    }
    if(title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
            title!
        ),
      ),
      body: content,
    );
  }
}