import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casiopea_01/models/carts.dart';
import 'package:casiopea_01/models/settings.dart';
import 'package:casiopea_01/screens/botnavbar.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Carts()),
        ChangeNotifierProvider(create: (context) => Settings()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
      builder: (context, settings, child) => MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          textTheme: Theme.of(context).textTheme.apply(
            fontSizeFactor: settings.fontSize / 16.0,
          ),
        ),
        home: const BotNavBar(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
