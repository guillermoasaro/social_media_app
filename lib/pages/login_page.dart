import 'package:flutter/material.dart';

import '../helpers.dart';

class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                  const Text("Hello Again!"),
                  const Text("Sign in to your account"),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.green,
                        validator: Helpers.emailValidator,
                        controller: emailController,
                        onEditingComplete: () => print("onEditingComplete"),
                        onTapOutside: (event) => print("onTapOutside"),
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          labelText: "Email address",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        cursorColor: Colors.green,
                        obscureText: true,
                        autocorrect: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Enter your password",
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.green),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            )));
  }
}
