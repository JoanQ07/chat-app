import 'package:chat_app/interfaces/user.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 82, 81, 81),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                autocorrect: true,
                autofocus: true,
                controller: usuarioController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: TextFormField(
                onFieldSubmitted: (value) => loginUser(context),
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                loginUser(context);
              },
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    final String usuario = usuarioController.text;
    final String password = passwordController.text;

    final Dio dio = Dio();
    const String url = 'http://localhost:3000/user/auth';
    final Map<String, dynamic> data = {"name": usuario, "password": password};

    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      if (response.statusCode == 200) {
        String? id = ResUser.fromJson(response.data).data.id;

        html.window.localStorage['id_user'] = id!;

        Navigator.pushNamed(context, "/home");
      } else {
        print("Error al realizar la solicitud: ${response.statusCode}");
      }
    } catch (e) {
      print("Error al realizar la solicitud: $e");
    }
  }

  @override
  void dispose() {
    usuarioController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
