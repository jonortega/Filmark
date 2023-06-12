import 'package:flutter/material.dart';

import '../services/tmdb_api_wrapper.dart' as tmdb_api;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String _displayText = '¡Hola, mundo!';
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _changeText() {
    setState(() {
      _displayText = _textEditingController.text;
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
          const SizedBox(height: 20),
          const ElevatedButton(
            onPressed: tmdb_api.fetchMovie,
            child: Text('Obtener datos'),
          ),
        ],
      ),
    );
  }
}
