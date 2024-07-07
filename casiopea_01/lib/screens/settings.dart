import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:casiopea_01/models/settings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _sendBugReports = false;
  double fontSize = 16.0; // Ukuran font awal

  final String defaultAvatar = 'assets/images/profile_pic1.jpg';

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Account'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            foregroundImage: AssetImage(defaultAvatar),
          ),
          SwitchListTile(
            title: const Text('Send bug reports'),
            value: _sendBugReports,
            onChanged: (value) {
              setState(() {
                _sendBugReports = value;
              });
            },
            activeColor: Colors.white, 
            activeTrackColor: Colors.red, 
          ),
          Slider(
            activeColor: Colors.redAccent,
            inactiveColor: Colors.redAccent[100], 
            value: settings.fontSize,
            min: 10,
            max: 20,
            divisions: 10,
            onChanged: (value) {
              setState(() {
                settings.fontSize = value;
              });
            },
          ),
          Text(
            'Current Font Size: ${settings.fontSize.toStringAsFixed(1)}',
            style: TextStyle(fontSize: settings.fontSize),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Send bug reports'),
              content: const Text('bugge repord'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        tooltip: 'Help',
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
