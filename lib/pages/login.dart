import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  _LoginState();

  void initState() {
    super.initState();
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
                const TextField(
                  decoration: InputDecoration(
                      helperText: 'Username'
                  ),
                ),

                const TextField(
                  decoration: InputDecoration(
                      helperText: 'Password'
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/default");
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
        )
    ),
    );
  }
}