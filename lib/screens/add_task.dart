import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:noteapp/firbaseapi/firebasenotification.dart';
import 'package:noteapp/wedgit/toast.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  addTaskToFirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? uid = user?.uid;
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection("my tasks")
        .doc(time.toString())
        .set({
      "title": titleController.text,
      "descrption": descriptionController.text,
      "time": time.toString(),
      "timestamp": time
    });
    // NotificationHelper.showNotification(
    //   time.hashCode,
    //   "New Task Added",
    //   "Title: ${titleController.text}\nDescription: ${descriptionController.text}",
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Enter Title',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Enter Description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onPressed: () {
                      addTaskToFirebase();
                      //toast().showToast();
                      // try {
                      //   Toast.showToast(context, 'Hello, Toast!');
                      // } on Exception catch (e) {
                      //   print(e);
                      // }
                      CustomToast.showToast(context, "task added");
                    },
                    child: Text(
                      "ADD Task",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          )),
    );
  }
}
