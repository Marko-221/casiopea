import 'dart:math';

// Random number generator
Random random = Random();

List<Map<String, dynamic>> foodsData = [
  {
    "nama": "Empanadas",
    "gambar": "assets/images/empanadas.jpg",
    "kategori": "Makanan",
    "harga": 25000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Birria Tacos",
    "gambar": "assets/images/tacos.jpg",
    "kategori": "Makanan",
    "harga": 20000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Greek Salad",
    "gambar": "assets/images/salad.jpg",
    "kategori": "Makanan",
    "harga": 15000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Moussaka",
    "gambar": "assets/images/moussaka.jpg",
    "kategori": "Makanan",
    "harga": 35000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Iced Tea",
    "gambar": "assets/images/icedtea.jpg",
    "kategori": "Minuman",
    "harga": 5000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Lemon Tea",
    "gambar": "assets/images/lemontea.jpg",
    "kategori": "Minuman",
    "harga": 7000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Cappucinno",
    "gambar": "assets/images/cappucinno.png",
    "kategori": "Minuman",
    "harga": 8000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Fruit Punch",
    "gambar": "assets/images/fruitpunch.jpg",
    "kategori": "Minuman",
    "harga": 10000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Cinnamon Churros",
    "gambar": "assets/images/churros.jpg",
    "kategori": "Cemilan",
    "harga": 8000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Cocadas",
    "gambar": "assets/images/cocadas.jpg",
    "kategori": "Cemilan",
    "harga": 6000,
    "stok": random.nextInt(11)
  },
  {
    "nama": "Baklava",
    "gambar": "assets/images/baklava.jpg",
    "kategori": "Cemilan",
    "harga": 10000,
    "stok": random.nextInt(11)
  },
];
