import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _email = " ";
  var _password = " ";
  var _username = " ";
  bool isloginpage = false;
  //----------------------
  startauthentacation() {
    final validity = _formkey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (validity!) {
      _formkey.currentState?.save();
      submetform(_email, _password, _username);
    }
  }

  submetform(String email, String password, String username) async {
    try {
      if (isloginpage) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String uid = userCredential.user!.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set({'username': username, "email": email});
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ListView(children: [
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isloginpage)
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: ValueKey('username'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " Incorrect  username";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value!;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide()),
                              labelText: "Enter Email"),
                        ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: ValueKey('email'),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return " Incorrect  Email Address";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide()),
                            labelText: "Enter Email"),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        key: ValueKey('password'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " Incorrect  password";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide()),
                            labelText: "Enter your password"),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 70,
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            startauthentacation();
                          },
                          child: isloginpage
                              // ignore: prefer_const_constructors
                              ? Text(
                                  'Login',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(fontSize: 20),
                                )
                              // ignore: prefer_const_constructors
                              : Text(
                                  'Signup',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(fontSize: 20),
                                ),
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      isloginpage = !isloginpage;
                    });
                  },
                  child: isloginpage
                      // ignore: prefer_const_constructors
                      ? Text("I Don't Have An Account")
                      // ignore: prefer_const_constructors
                      : Text("I Alredy Have An Account")),
            )
          ]),
        ),
      ),
    );
  }
}
