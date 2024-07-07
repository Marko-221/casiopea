import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casiopea_01/models/settings.dart';

class FontSizeSetting extends StatelessWidget {
  const FontSizeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<Settings>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Font'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ukuran Font: ${settings.fontSize.toStringAsFixed(1)}',
              style: TextStyle(fontSize: settings.fontSize),
            ),
            Slider(
              value: settings.fontSize,
              min: 10.0,
              max: 30.0,
              divisions: 40,
              label: settings.fontSize.toString(),
              onChanged: (value) {
                settings.fontSize = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

