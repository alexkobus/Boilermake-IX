import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/user.dart';
import 'package:thoughtify/pages/verify.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.errorState}) : super(key: key);
  _LoginState createState() => _LoginState();
  final bool errorState;
}

class _LoginState extends State<Login> {
  final uController = TextEditingController();
  final pController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    uController.dispose();
    pController.dispose();
    super.dispose();
  }

  _LoginState();

  void initState() {
    super.initState();
  }

  void validateLoginInfo(String? email, String? password, String phone, String role) async {
    bool valid = false;

    if (email != null && password != null && email != "" && password != "") {

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword
          (email: email, password: password);
        valid = true;
      } on FirebaseAuthException catch (e) {
        valid = false;
      }
    }

    if (valid == true) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify(phoneNum: phone, errorState: false, role: role)));
    } else {
      Navigator.popAndPushNamed(context, "/loginError");
    }
  }



  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
    List<UserStuff> usersList = <UserStuff>[];
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        usersList.clear();
        if (snapshot.data != null) {
          for (var doc in snapshot.data!.docs) {
            usersList.add(UserStuff(
                doc.id, doc["email"], doc["name"], doc["role"], doc["phone"]));
          }
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Login to Thoughtify"),
          ),
          body: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: (widget.errorState)
                          ? const Text(
                        "Incorrect email address or password.",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    TextField(
                      controller: uController,
                      decoration: const InputDecoration(
                          helperText: 'Email Address'),
                    ),

                    TextField(
                      controller: pController,
                      decoration: const InputDecoration(helperText: 'Password'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        String phone = "+11111111111";
                        String role = "Student";
                        for (UserStuff user in usersList) {
                          if (user.email == uController.text) {
                            phone = user.phone;
                            role = user.role;
                            break;
                          }
                        }
                        validateLoginInfo(uController.text, pController.text, phone, role);
                      },
                      child: const Text('Login'),
                    ),

                    //empty widget for padding
                    const SizedBox(
                      width: 50,
                      height: 30,
                    ),

                    GestureDetector(
                      child: const Text(
                          "Don't have an account? Tap here to sign up.",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue)),
                      onTap: () async {
                        Navigator.pushNamed(context, "/signup");
                      },
                    )
                  ],
                ),
              )),
        );
      }
    );
  }
}