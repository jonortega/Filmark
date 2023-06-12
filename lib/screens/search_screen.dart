import 'package:flutter/material.dart';
import '../widgets/custom_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String _displayText = '¡Hola, mundo!';
  final TextEditingController _textEditingController = TextEditingController();

  void _changeText() {
    setState(() {
      _displayText = _textEditingController.text;
    });
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
            child: CustomImput(),
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
}
