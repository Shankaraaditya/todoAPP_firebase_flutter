import 'package:flutter/material.dart';
import 'package:to_do_app/auth/authform.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Authentication"),
        backgroundColor: Colors.deepPurple,
      ),
      body: AuthForm(), // if the user is not signed in 
    );
  }
}