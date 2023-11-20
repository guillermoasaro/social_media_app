import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/text_input.dart';
import '../constants.dart';
import '../helpers.dart';
import '../repositories/user_repository.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  Future loginSession(BuildContext context) async {
    bool resultValidation = formKey.currentState?.validate() ?? false;
    print("RESULT VALIDATION IS: $resultValidation");

    if (resultValidation) {
      //ENVIAR CAMPOS AL SERVIDOR
      try {
        var logged = await UserRepository().loginUser(
            email: emailController.text, password: passwordController.text);
      } catch (e) {
        print("ERROR CAPTURADO: $e");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${e.toString()}")));
      }

      var prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLogged", true);

      // EL SERVIDOR ME DICE QUE OK
      /*Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder:(context)=>GamePage()
                            )
                          );*/
      /*Helpers.navigate(
                              context: context,
                              page: TabsPage(),
                              isReplacement: true);*/
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: remove default user
    emailController.value = const TextEditingValue(text: "test@tester.com");
    passwordController.value = const TextEditingValue(text: "123456");
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 128, 24, 24),
              child: Column(
                children: [
                  const Text("Hello Again!",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  const Text("Sign in to your account",
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 42),
                  Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              validator: Helpers.emptyTextValidator,
                              obscureText: true),
                          const SizedBox(height: 42),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () => loginSession(context),
                              child: const Text("Sign in"),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            )));
  }
}
