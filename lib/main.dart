import 'package:flutter/material.dart';
import 'package:to_do_app/auth/authscreen.dart';
import 'package:to_do_app/screens/home.dart';
import 'package:to_do_app/auth/authFunctions.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeWidget(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple
        
      ),
    );
  }
}

