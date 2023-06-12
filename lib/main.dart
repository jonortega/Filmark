import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/search_screen.dart';
import 'screens/lists_screen.dart';
import 'providers/app_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        title: 'Mi App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

enum Screen { search, lists }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Screen _currentScreen = Screen.search;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        _currentScreen = Screen.search;
      } else {
        _currentScreen = Screen.lists;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    if (_currentScreen == Screen.search) {
      currentScreen = const SearchScreen();
    } else {
      currentScreen = const ListsScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi App'),
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreen == Screen.search ? 0 : 1,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listas',
          ),
        ],
      ),
    );
  }
}
