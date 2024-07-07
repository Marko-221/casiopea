import 'package:flutter/material.dart';
import 'package:casiopea_01/models/cart.dart';

class Carts with ChangeNotifier {
  final List<Cart> _carts = [];
  bool _isSnackbarActive = false;

  List<Cart> get carts => _carts;

  void addCart(Cart cart, BuildContext context) {
    final existingCartIndex = _carts.indexWhere((c) => c.food.nama == cart.food.nama);
    if (existingCartIndex >= 0) {
      if (cart.food.stok > 0) {
        _carts[existingCartIndex].jumlah++;
        cart.food.stok--; // Kurangi stok setelah menambahkan ke keranjang
        notifyListeners();
      } else {
        _showOutOfStockSnackbar(context, cart.food.nama);
      }
    } else {
      if (cart.food.stok > 0) {
        _carts.add(cart);
        cart.food.stok--; // Kurangi stok setelah menambahkan ke keranjang
        notifyListeners();
      } else {
        _showOutOfStockSnackbar(context, cart.food.nama);
      }
    }
  }

  void _showOutOfStockSnackbar(BuildContext context, String foodName) {
    if (!_isSnackbarActive) {
      _isSnackbarActive = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sorry, we're out of $foodName!"),
          duration: const Duration(seconds: 3),
        ),
      ).closed.then((_) {
        _isSnackbarActive = false;
      });
    }
  }

  void removeCart(Cart cart) {
    // Kembalikan stok sesuai dengan jumlah dalam keranjang
    cart.food.stok += cart.jumlah;
    _carts.remove(cart);
    notifyListeners();
  }

  void checkout() {
    _carts.clear();
    notifyListeners();
  }

  void increaseQuantity(Cart cart) {
    final existingCartIndex = _carts.indexWhere((c) => c.food.nama == cart.food.nama);
    if (existingCartIndex >= 0 && _carts[existingCartIndex].food.stok > 0) {
      _carts[existingCartIndex].jumlah++;
      _carts[existingCartIndex].food.stok--;
      notifyListeners();
    }
  }

  void decreaseQuantity(Cart cart) {
    final existingCartIndex = _carts.indexWhere((c) => c.food.nama == cart.food.nama);
    if (existingCartIndex >= 0) {
      if (_carts[existingCartIndex].jumlah > 1) {
        _carts[existingCartIndex].jumlah--;
        _carts[existingCartIndex].food.stok++;
      } else {
        removeCart(cart); // Hapus pesanan jika jumlahnya menjadi 0
      }
      notifyListeners();
    }
  }

  int get totalPrice {
    if (carts.isEmpty) {
      debugPrint("Kosongg");
      return 0;
    }

    int total = 0;

    for (int i = 0; i < carts.length; i++) {
      total += carts[i].food.harga * carts[i].jumlah; // Perhitungkan jumlah
    }

    return total;
  }
}
