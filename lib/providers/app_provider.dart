import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier {
  String _displayText = '¡Hola, mundo!';

  String get displayText => _displayText;

  set displayText(String newText) {
    _displayText = newText;
    notifyListeners();
  }
}
