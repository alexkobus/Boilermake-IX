import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key, required this.errorState}) : super(key: key);
  _SignupState createState() => _SignupState();
  final bool errorState;
}

class _SignupState extends State<Signup> {
  final uController = TextEditingController();
  final pController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    uController.dispose();
    pController.dispose();
    super.dispose();
  }

  _SignupState();

  void initState() {
    super.initState();
  }

  void validateLoginInfo(String? username, String? password) {
    //TODO: check login info with the database
    bool valid = false;

    if (username != null && password != null && username != "" && password != "") {
      valid = true;
    }

    if (valid == true) {
      Navigator.pushNamed(context, "/default");
      //TODO: make this go to the homepage of the app
    } else {
      Navigator.popAndPushNamed(context, "/signupError");
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
        title: Text("Create an Account"),
      ),

      body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: (widget.errorState)
                      ? const Text("Incorrect username or password.",
                    style: TextStyle(color: Colors.red),
                  )
                      : null,
                ),

                TextField(
                  controller: uController,
                  decoration: const InputDecoration(
                      helperText: 'Username'
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
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          )
      ),
    );
  }
}