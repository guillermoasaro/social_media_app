import 'package:flutter/material.dart';

import '../components/text_input.dart';
import '../helpers.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 128, 24, 24),
              child: Column(
                children: [
                  const Text("Hello Again!", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  const Text("Sign in to your account", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 32),
                  Form(
                      child: Column(
                    children: [
                      TextInput(
                          inputController: emailController,
                          labelText: "Email address",
                          hintText: "Enter your email",
                          validator: Helpers.emailValidator),
                      const SizedBox(height: 16),
                      TextInput(
                          inputController: passwordController,
                          labelText: "Password",
                          hintText: "Enter your password",
                          obscureText: true),
                    ],
                  )),
                ],
              ),
            )));
  }
}
