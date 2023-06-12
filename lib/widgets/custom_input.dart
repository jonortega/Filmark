import 'package:flutter/material.dart';

class CustomImput extends StatefulWidget {
  @override
  State<CustomImput> createState() => _CustomImputState();
}

class _CustomImputState extends State<CustomImput> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: _buildInputDecoration('Introduce el nuevo texto', 'Texto'),
    );
  }
}
