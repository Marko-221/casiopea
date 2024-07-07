import 'package:flutter/material.dart';
import 'package:casiopea_01/models/carts.dart';
import 'package:casiopea_01/widgets/list_cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Are you sure about your order?'),
          actions: [
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Checkout cancelled.")));
              },
            ),
            TextButton(
              child: const Text('CONFIRM'),
              onPressed: () {
                context.read<Carts>().checkout();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Your order is accepted, hang tight!")));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Consumer<Carts>(
                builder: (context, carts, child) {
                  return ListView(
                    children: carts.carts.map((cart) {
                      return ListCart(
                        cart: cart,
                        onDelete: () {
                          carts.removeCart(cart);
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Checkout Rp. ${context.watch<Carts>().totalPrice} "),
            ),
          ],
        ),
      ),
    );
  }
}
