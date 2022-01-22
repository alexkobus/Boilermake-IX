import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/post.dart';
import 'package:thoughtify/models/user.dart';

class Application extends StatefulWidget {
  const Application({Key? key, required this.post}) : super(key: key);
  _ApplicationState createState() => _ApplicationState();
  final Post? post;
}

class _ApplicationState extends State<Application> {
  User currentUser = User("defaultuser@default.com", "password", "Default User", "Student");
  final ScrollController _scrollController = ScrollController();
  final eController = TextEditingController(text: "email");
  final pController = TextEditingController();
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

  _ApplicationState();

  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() {
    //TODO: get user's information from database
    currentUser = User("defaultuser@default.com", "password", "Default User", "Student");
  }

  void apply() {
    //TODO: send application info to database

    Navigator.pushNamed(context, "/default");
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
        title: Text("Apply"),
      ),

      body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(widget.post!.prof.name + "'s Post", style: TextStyle(fontWeight: FontWeight.bold),),

                    Text(widget.post!.desc),

                    TextFormField(
                      readOnly: true,
                      initialValue: currentUser.name,
                      decoration: const InputDecoration(
                          helperText: 'Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: currentUser.email,
                      decoration: const InputDecoration(
                          helperText: 'Email Address'
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        apply();
                      },
                      child: const Text('Send Application'),
                    ),
                  ],
                ),)
          )
      ),
    );
  }
}