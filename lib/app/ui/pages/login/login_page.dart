import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retotok/app/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sign in with Google', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () async {
                  await controller.signInWithGoogle();
                },
                icon: const Icon(Icons.login),
                label: const Text('Sign In with Google'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue, // Color del botón
                  backgroundColor: Colors.white, // Color del texto/icono
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
