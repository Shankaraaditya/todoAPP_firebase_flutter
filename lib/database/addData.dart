import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String title;
  final String discription;
  // final int age;

  const AddUser(this.title, this.discription, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': title, // John Doe
            'company': discription, // Stokes and Sons
            // 'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: const Text(
        "Add User",
      ),
    );
  }
}

String title = "";
String discription = "";

addtasktofirebase() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  String uid = users.id;
  var time = DateTime.now();

  await FirebaseFirestore.instance
      .collection('tasks')
      .doc(uid)
      .collection('mytasks')
      .doc(time.toString())
      .set({
    'title': title,
    'discription': discription,
    'time': time.toString()
  });
}
