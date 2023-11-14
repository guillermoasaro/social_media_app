import 'package:flutter/material.dart';
import 'package:social_media_app/pages/login_page.dart';

void main() {
  runApp(SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  bool isLogged;

  SocialMediaApp({super.key, this.isLogged = false});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLogged ? const Placeholder() : LoginPage(),
    );
  }
}