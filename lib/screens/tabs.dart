import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favorites_meals_provider.dart';
import 'package:meal_app/providers/meal_provider.dart';

import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import 'categories.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }

}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if(identifier == 'filters') {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx)=>
              const FilterScreen(),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(mealsProvider);

    Widget activePage = CategoryScreen(availableMeals: availableMeals,);
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favoritesMeals = ref.watch(favoritesMealProvider);
      activePage = MealsScreen(
        meals: favoritesMeals
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
            activePageTitle
        ),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }

}