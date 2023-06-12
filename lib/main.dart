import 'package:flutter/material.dart';
import 'screens/search_screen.dart';
import 'screens/lists_screen.dart';
// import 'widgets/';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

// Paginas de la app
enum Screen { search, lists }

class MyAppState extends State<MyApp> {
  Screen _currentScreen = Screen.search;

  // Navegar entre las dos paginas de la app
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

    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
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
      ),
    );
  }
}
