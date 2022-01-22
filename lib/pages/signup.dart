import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key, required this.errorState}) : super(key: key);
  _SignupState createState() => _SignupState();
  final int errorState;
  //0 = no error
  //1 = Invalid Information
  //2 = Email Error
  //3 = Weak Password
}

class _SignupState extends State<Signup> {
  final ScrollController _scrollController = ScrollController();
  final pController = TextEditingController();
  final eController = TextEditingController();
  final nController = TextEditingController();

  String selectedValue = "Student";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pController.dispose();
    eController.dispose();
    nController.dispose();
    super.dispose();
  }

  _SignupState();

  void initState() {
    super.initState();
  }

  void validateInfo(String? password, String? email, String? name, String? role) async {
    //TODO: save user's info to the database
    if (password != null && password.length < 6) {
      Navigator.popAndPushNamed(context, "/signupErrorPass");
    }

    if (email != null && !RegExp(".+@.+\..+").hasMatch(email)) {
      Navigator.popAndPushNamed(context, "/signupErrorEmail");
    }

    bool valid = false;

    if (password != null && email != null && name != null
        && password != "" && email != "" && name != "") {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        valid = true;
      } on FirebaseAuthException catch (e) {
        // if (e.code == 'weak-password') {
        //   // TODO do something
        // } else if (e.code == 'email-already-in-use') {
        //   // TODO do something
        // }
        valid = false;
      }
    }

    if (valid == true) {
      Navigator.pushNamed(context, "/");
    } else {
      Navigator.popAndPushNamed(context, "/signupError");
    }
  }

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Student"),value: "Student"),
      DropdownMenuItem(child: Text("Professor"),value: "Professor"),
    ];
    return menuItems;
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
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: (widget.errorState == 1)
                          ? const Text("Invalid Information",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 2)
                          ? const Text("Invalid Email Address:",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 2)
                          ? const SizedBox(
                            height: 10,
                          )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 2)
                          ? const Text("Email address must be in the format",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 2)
                          ? const Text("\"email@example.com\"",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 3)
                          ? const Text("Invalid Password:",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 3)
                          ? const Text("Password must be at least 6 characters long.",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    TextField(
                      controller: eController,
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

                    TextField(
                      controller: nController,
                      decoration: const InputDecoration(
                          helperText: 'Name'
                      ),
                    ),

                    DropdownButton(
                        value: selectedValue,
                        onChanged: (String? newValue){
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems
                    ),

                    ElevatedButton(
                      onPressed: () {
                        validateInfo(pController.text, eController.text, nController.text, selectedValue);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),)
          )
      ),
    );
  }
}