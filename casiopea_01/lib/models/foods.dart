import 'package:casiopea_01/data/foods.dart';
import 'package:casiopea_01/models/food.dart';

class Foods {
  late List<Food> _foods;

  List<Food> get foods => _foods;

  Foods() {
    _foods = [
      ...foodsData.map((food) => Food(
          nama: food["nama"],
          gambar: food["gambar"],
          harga: food["harga"],
          kategori: food["kategori"],
          stok: food["stok"],
      ))
    ];
  }
}
