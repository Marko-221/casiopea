import 'package:casiopea_01/screens/orderhistory.dart';
import 'package:flutter/material.dart';
import 'package:casiopea_01/models/carts.dart';
import 'package:casiopea_01/models/foods.dart';
import 'package:casiopea_01/screens/cart.dart';
import 'package:casiopea_01/screens/login.dart';
import 'package:casiopea_01/widgets/food_card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Foods _food = Foods();
  bool _showBanner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Casiopea",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Consumer<Carts>(
              builder: (context, value, child) => Badge.count(
                count: value.carts.length,
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundImage: AssetImage('/images/profile_pic1.jpg'),
                    radius: 40,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Jane Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'janedoe@email.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LogIn(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Order History"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OrderHistory(),
                ));
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          if (_showBanner)
            Container(
              color: Color.fromARGB(255, 195, 195, 195),
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Join and get 10% off now!",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showBanner = false;
                      });
                    },
                    child: const Text(
                      "DISMISS",
                      style: TextStyle(color: Color.fromARGB(255, 255, 67, 54)),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.25,
                ),
                children: _food.foods.map((food) => FoodCard(food: food)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
