import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/database/addData.dart';

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  ////////////------AKSHIT MADAN CODE-------------//////////////

  // TextEditingController titleController = TextEditingController();
  // TextEditingController discriptionController = TextEditingController();

  // addtaskToFirebase() async {
  //   FirebaseAuth use = FirebaseAuth.instance;
  //   FirebaseFirestore user = await use.currentUser();
  // }

  ////////////------AKSHIT MADAN CODE-------------//////////////

  // String title = "";
  // String discription = "";


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

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String uid = users.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Task"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: TextField(
                // controller: titleController,
                decoration: const InputDecoration(
                    label: Text('Enter Title'), border: OutlineInputBorder()),
                key: const ValueKey("title"),
                onChanged: (value) {
                  title = value;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                  // controller: discriptionController,
                  decoration: const InputDecoration(
                      label: Text("Enter Discription"),
                      border: OutlineInputBorder()),
                  key: const ValueKey("discription"),
                  onChanged: (value) {
                    discription = value;
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(backgroundColor:
                  MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.purple.shade100;
                } else {
                  return Theme.of(context).primaryColor;
                }
              })),
              onPressed: () async {
                // AddUser(title, discription);

                // await users.add({
                //   'title': title,
                //   'discription': discription,
                // }).then((value) => print("User Addeddddd"));

                addtasktofirebase();
              },
              child: Text(
                ' Add Task',
                style: GoogleFonts.roboto(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
