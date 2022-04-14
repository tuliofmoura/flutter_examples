import 'package:flutter/material.dart';
import 'package:meal_example/screens/category_meals_screen.dart';
import 'package:meal_example/screens/filters_screen.dart';
import 'package:meal_example/screens/meal_detail_screen.dart';
import 'package:meal_example/screens/tabs_screen.dart';

import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
          ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData.copyWith(
        colorScheme: themeData.colorScheme.copyWith(
          secondary: Colors.amber,
        ),
      ),
      routes: {
        '/': (context) => const TabsScreen(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FiltersScreen.routeName: (context) => const FiltersScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => const CategoriesScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T-Meals'),
      ),
      body: const Center(
        child: Text('Navigation time!'),
      ),
    );
  }
}
