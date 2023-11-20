import 'package:flutter/material.dart';

import '../components/text_input.dart';
import '../constants.dart';
import '../helpers.dart';
import '../repositories/user_repository.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                    key: formKey,
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
                      const SizedBox(height:20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )
                          ),
                          onPressed: () async{
                            //AQUI PULSO EL BOTON ENTRAR

                            bool resultValidation =
                                formKey.currentState?.validate() ?? false;
                            print("RESULT VALIDATION IS: $resultValidation");

                            if(resultValidation){
                              print("ENVIO ${emailController.text}");
                              print("ENVIO ${passwordController.text}");
                              //ENVIAR CAMPOS AL SERVIDOR
                              try {
                                var logged = await UserRepository()
                                    .loginUser(email: emailController.text,
                                    password: passwordController.text);
                              }catch(e){
                                print("ERROR CAPTURADO: $e");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("${e.toString()}"))
                                );



                              }

                              //var prefs = await SharedPreferences.getInstance();
                              //prefs.setBool("isLogged", true);

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
                          },
                          child: Text("ENTRAR"),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            )));
  }
}
