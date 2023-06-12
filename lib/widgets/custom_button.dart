import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late String _displayText;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _displayText = Provider.of<AppProvider>(context, listen: false).displayText;
    _textEditingController = TextEditingController(text: _displayText);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _changeText() {
    setState(() {
      _displayText = _textEditingController.text;
      Provider.of<AppProvider>(context, listen: false).displayText =
          _displayText;
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
    return ElevatedButton(
      onPressed: _changeText,
      style: _buildButtonStyle(),
      child: const Text('Cambiar texto'),
    );
  }
}
