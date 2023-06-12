import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({super.key});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late TextEditingController _textEditingController;
  // ignore: unused_field
  late String _displayText;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _displayText = Provider.of<AppProvider>(context, listen: false).displayText;
  }

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
      onChanged: (value) {
        setState(() {
          _displayText = value;
        });
      },
    );
  }
}
