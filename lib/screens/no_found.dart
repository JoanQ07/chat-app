import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oops! Page Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'The page you requested was not found.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16.0),
            OutlinedButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, '/'), // Go back to home page
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
