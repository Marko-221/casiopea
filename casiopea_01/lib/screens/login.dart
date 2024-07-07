import 'package:casiopea_01/data/user.dart';
import 'package:casiopea_01/screens/home.dart';
import 'package:casiopea_01/screens/settings.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String enteredEmail = '';
  String enteredPassword = '';
  bool keepSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Login'),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.support_agent,
              color: Colors.white,
            ),
            onSelected: (int result) {
              if (result == 0) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ));
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Settings'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Help'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Send Feedback'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                enteredEmail = value;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                enteredPassword = value;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: keepSignedIn,
                  onChanged: (value) {
                    setState(() {
                      keepSignedIn = value ?? false;
                    });
                  },
                  activeColor: Colors.red, 
                  checkColor: Colors.white, 
                ),
                const Text("Keep me signed in"),
              ],
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  bool isAuthenticated = User.registeredUsers.any((user) =>
                      user.email == enteredEmail && user.password == enteredPassword);
                  if (isAuthenticated) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: const Text('Success!'),
                              content: const Text('Log in successful'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                )
                              ]);
                        });
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Email or password not valid.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
