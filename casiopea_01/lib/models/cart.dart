import 'package:flutter/material.dart';
import 'package:casiopea_01/models/food.dart';

class Cart with ChangeNotifier {
  Food food;
  int jumlah = 1;

  Cart({required this.food, this.jumlah = 1});
}
