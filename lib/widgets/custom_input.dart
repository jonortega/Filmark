import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return TextField(
      controller: appProvider.textEditingController,
      decoration: _buildInputDecoration('Introduce el nuevo texto', 'Texto'),
      onChanged: (value) {
        appProvider.displayText = value;
      },
    );
  }

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
}
