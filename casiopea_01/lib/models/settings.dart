import 'package:flutter/material.dart';

class Settings with ChangeNotifier {
  double _fontSize = 16.0; // Ukuran font default

  double get fontSize => _fontSize;

  set fontSize(double size) {
    _fontSize = size;
    notifyListeners(); // Memberitahu listener (widget) bahwa nilai telah berubah
  }
}
