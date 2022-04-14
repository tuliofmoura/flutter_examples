import 'package:flutter/material.dart';
import 'package:meal_example/screens/categories_screen.dart';
import 'package:meal_example/screens/favorites_screen.dart';
import 'package:meal_example/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = const [
    {
      'title': 'Categories',
      'page': CategoriesScreen(),
    },
    {
      'title': 'Your Favorites',
      'page': FavoritesScreen(),
    },
  ];

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //return _buildTopTabBar();
    return _buildBottomTabBar(context);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget _buildBottomTabBar(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorites',
          ),
        ],
        onTap: _selectPage,
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
    );
  }

  Widget _buildTopTabBar() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavoritesScreen(),
        ]),
      ),
    );
  }
}
