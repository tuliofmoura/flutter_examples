import 'package:flutter/material.dart';
import 'package:meal_example/dummy_data.dart';
import 'package:meal_example/models/meal.dart';
import 'package:meal_example/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late final String categoryTitle;
  late final List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    debugPrint('didchange');
    super.didChangeDependencies();
    final Map<String, String> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = arguments['title']!;
    final String categoryId = arguments['id']!;
    categoryMeals = dummyMeals
        .where((element) => element.categories.contains(categoryId))
        .toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          callback: (String result) => _removeMeal(result),
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          complexity: categoryMeals[index].complexity,
          affordability: categoryMeals[index].affordability,
        ),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
