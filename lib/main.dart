import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/home.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/no_found.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppChat());
}

class MyAppChat extends StatelessWidget {
  const MyAppChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginApp(
              key: null,
            ),
        '/home': (context) => const HomeApp(),
        '/chat': (context) => ChatUser(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const PageNotFound());
      },
    );
  }
}
