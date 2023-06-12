import 'package:flutter/material.dart';

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
  String _displayText = '¡Hola, mundo!';
  final TextEditingController _textEditingController = TextEditingController();

  void _changeText() {
    setState(() {
      _displayText = _textEditingController.text;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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

  // Decoracion del Input
  InputDecoration _buildInputDecoration(String labelText, String hintText) {
    return InputDecoration(
      prefixIcon: const Icon(Icons.edit),
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Color.fromARGB(255, 161, 175, 161),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontStyle: FontStyle.italic,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 161, 175, 161),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.green,
          width: 2,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
    );
  }

  // Estilo del ElevatedButton
  ButtonStyle _buildButtonStyle() {
    return ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    if (_currentScreen == Screen.search) {
      currentScreen = buildSearchScreen();
    } else {
      currentScreen = buildListsScreen();
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

  Widget buildSearchScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _displayText,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              controller: _textEditingController,
              decoration:
                  _buildInputDecoration('Introduce el nuevo texto', 'Texto'),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _changeText,
            style: _buildButtonStyle(),
            child: const Text('Cambiar texto'),
          ),
        ],
      ),
    );
  }

  Widget buildListsScreen() {
    List<String> listNames = ['Vistas', 'Por ver', 'Favoritas', 'Acción'];

    return ListView.builder(
      itemCount: listNames.length,
      itemBuilder: (context, index) {
        String listName = listNames[index];

        return InkWell(
          onTap: () {
            // Lógica para manejar el clic en la lista
            // Aquí podrías navegar a la pantalla de películas de esa lista
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                listName,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
