import 'package:flutter/material.dart';
import 'package:casiopea_01/models/cart.dart';
import 'package:casiopea_01/models/carts.dart';
import 'package:casiopea_01/models/food.dart';
import 'package:casiopea_01/widgets/cart_button.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Card(
      // Margin utk memisahkan card agar tidak saling menempel 
      margin: const EdgeInsets.all(8), 
      // Padding di sekeliling isi Card agar isi dalam card tidak melebar sampai tepi card
      child: Padding(
        padding: const EdgeInsets.all(8), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                food.gambar,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              food.nama,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              food.kategori,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 4),
            Text(
              "Rp. ${food.harga}",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Consumer<Carts>(
              builder: (context, carts, child) {
                return Text(
                  "Stok: ${food.stok}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                  ),
                );
              },
            ),
            const SizedBox(height: 8), // Tambahkan jarak sebelum tombol
            CartButton(
              onClick: () {
                context.read<Carts>().addCart(Cart(food: food), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
