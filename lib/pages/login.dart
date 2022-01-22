import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  void validateLoginInfo(String? email, String? password) async {
    bool valid = false;

    if (email != null && password != null && email != "" && password != "") {

      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword
          (email: email, password: password); // TODO unclear where to use this UserCredential
        valid = true;
      } on FirebaseAuthException catch (e) {
        valid = false;
      }
    }

    if (valid == true) {
      Navigator.pushNamed(context, "/student_home");
      //TODO: make this go to the homepage of the app
    } else {
      Navigator.popAndPushNamed(context, "/loginError");
    }
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                      ? const Text("Incorrect email address or password.",
                    style: TextStyle(color: Colors.red),
                  )
                      : null,
                ),

                TextField(
                  controller: uController,
                  decoration: const InputDecoration(
                      helperText: 'Email Address'
                  ),
                ),

                TextField(
                  controller: pController,
                  decoration: const InputDecoration(
                      helperText: 'Password'
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    validateLoginInfo(uController.text, pController.text);
                  },
                  child: const Text('Login'),
                ),

                //empty widget for padding
                const SizedBox(
                  width: 50,
                  height: 30,
                ),

                GestureDetector(
                  child: const Text("Don't have an account? Tap here to sign up.",
                      style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)
                  ),
                  onTap: () async {
                    Navigator.pushNamed(context, "/signup");
                  },
                )
              ],
            ),
          )
      ),
    );
  }
}