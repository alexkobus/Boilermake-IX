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
  User currentUser = User("defaultuser@default.com", "password", "Default User", "Student", "+14444444444");
  final ScrollController _scrollController = ScrollController();
  final wtController = TextEditingController();
  final wcController = TextEditingController();
  final wdController = TextEditingController();
  final wsdController = TextEditingController();
  final wedController = TextEditingController();
  final uController = TextEditingController();
  final usdController = TextEditingController();
  final uedController = TextEditingController();
  final udController = TextEditingController();
  final umController = TextEditingController();
  final gpaController = TextEditingController();
  final sController = TextEditingController();
  final linController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    wtController.dispose();
    wcController.dispose();
    wdController.dispose();
    wsdController.dispose();
    wedController.dispose();
    uController.dispose();
    usdController.dispose();
    uedController.dispose();
    udController.dispose();
    umController.dispose();
    gpaController.dispose();
    sController.dispose();
    linController.dispose();
    super.dispose();
  }

  _ApplicationState();

  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() {
    //TODO: get user's information from database
    currentUser = User("defaultuser@default.com", "password", "Default User", "Student", "+14444444444");
  }

  void apply(String? name, String? email, String? jobTitle, String? companyName, String? jobDesc,
      String? jobSDate, String? jobEDate, String? univName, String? univSDate, String? univEDate,
      String? degreeType, String? major, String? gpa, String? skills, String? linURL) {

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
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
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

                    TextField(
                      controller: wtController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience: Job Title'
                      ),
                    ),

                    TextField(
                      controller: wcController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience: Company Name'
                      ),
                    ),

                    TextField(
                      controller: wdController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience: Description'
                      ),
                    ),

                    TextField(
                      controller: wsdController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience: Start Date'
                      ),
                    ),

                    TextField(
                      controller: wedController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience: End Date'
                      ),
                    ),

                    TextField(
                      controller: uController,
                      decoration: const InputDecoration(
                          helperText: 'Education: School Name'
                      ),
                    ),

                    TextField(
                      controller: usdController,
                      decoration: const InputDecoration(
                          helperText: 'Education: Start Date'
                      ),
                    ),

                    TextField(
                      controller: uedController,
                      decoration: const InputDecoration(
                          helperText: 'Education: Graduation Date'
                      ),
                    ),

                    TextField(
                      controller: udController,
                      decoration: const InputDecoration(
                          helperText: 'Education: Degree'
                      ),
                    ),

                    TextField(
                      controller: umController,
                      decoration: const InputDecoration(
                          helperText: 'Education: Major'
                      ),
                    ),

                    TextField(
                      controller: gpaController,
                      decoration: const InputDecoration(
                          helperText: 'Education: GPA'
                      ),
                    ),

                    TextField(
                      controller: sController,
                      decoration: const InputDecoration(
                          helperText: 'Skills'
                      ),
                    ),

                    TextField(
                      controller: linController,
                      decoration: const InputDecoration(
                          helperText: 'Linkedin URL'
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        apply(currentUser.name, currentUser.email, wtController.text, wcController.text, wdController.text,
                        wsdController.text, wedController.text, uController.text, usdController.text, uedController.text,
                        udController.text, umController.text, gpaController.text, sController.text, linController.text);
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