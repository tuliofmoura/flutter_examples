import 'package:flutter/material.dart';
import 'package:meal_example/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  static const String routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
