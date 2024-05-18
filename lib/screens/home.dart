import 'package:chat_app/screens/nav_bar.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: NavBarChat(),
      body: Center(
        child: Text("App"),
      ),
      backgroundColor: Color.fromARGB(31, 241, 240, 240),
    );
  }
}
