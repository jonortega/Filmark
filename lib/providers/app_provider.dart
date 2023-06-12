import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  late String _displayText;
  late TextEditingController _textEditingController;

  AppProvider() {
    _displayText = '¡Hola, mundo!';
    _textEditingController = TextEditingController(text: _displayText);
  }

  String get displayText => _displayText;

  set displayText(String newText) {
    _displayText = newText;
    notifyListeners();
  }

  TextEditingController get textEditingController => _textEditingController;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
