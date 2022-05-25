import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, Object>> _pages;
  int _selectPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Your Favorites'
      }
    ];

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectPageIndex]['title'] as String),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ));
  }
}
