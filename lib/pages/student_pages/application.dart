import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/post.dart';

class Application extends StatefulWidget {
  const Application({Key? key, required this.post}) : super(key: key);
  _ApplicationState createState() => _ApplicationState();
  final Post? post;
}

class _ApplicationState extends State<Application> {
  final ScrollController _scrollController = ScrollController();
  final wtController = TextEditingController();
  final wcController = TextEditingController();
  final wdController = TextEditingController();
  final wsdController = TextEditingController();
  final wedController = TextEditingController();
  final wt2Controller = TextEditingController();
  final wc2Controller = TextEditingController();
  final wd2Controller = TextEditingController();
  final wsd2Controller = TextEditingController();
  final wed2Controller = TextEditingController();
  final uController = TextEditingController();
  final usdController = TextEditingController();
  final uedController = TextEditingController();
  final udController = TextEditingController();
  final umController = TextEditingController();
  final gpaController = TextEditingController();
  final u2Controller = TextEditingController();
  final usd2Controller = TextEditingController();
  final ued2Controller = TextEditingController();
  final ud2Controller = TextEditingController();
  final um2Controller = TextEditingController();
  final gpa2Controller = TextEditingController();
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
    wt2Controller.dispose();
    wc2Controller.dispose();
    wd2Controller.dispose();
    wsd2Controller.dispose();
    wed2Controller.dispose();
    uController.dispose();
    usdController.dispose();
    uedController.dispose();
    udController.dispose();
    umController.dispose();
    gpaController.dispose();
    u2Controller.dispose();
    usd2Controller.dispose();
    ued2Controller.dispose();
    ud2Controller.dispose();
    um2Controller.dispose();
    gpa2Controller.dispose();
    sController.dispose();
    linController.dispose();
    super.dispose();
  }

  _ApplicationState();

  void initState() {
    super.initState();
  }

  void apply(String? name, String? email, String? jobTitle, String? companyName, String? jobDesc,
      String? jobSDate, String? jobEDate, String? univName, String? univSDate, String? univEDate,
      String? degreeType, String? major, String? gpa,String? jobTitle2, String? companyName2, String? jobDesc2,
  String? jobSDate2, String? jobEDate2, String? univName2, String? univSDate2, String? univEDate2,
      String? degreeType2, String? major2, String? gpa2, String? skills, String? linURL) {

    //TODO: send application info to database

    //TODO: get application status from db
    Navigator.pushNamed(context, "/statusInprogress");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment_ind),
            onPressed: () {
              Navigator.pushNamed(context, "/profile");
            },
          ),
        ],
      ),

      body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(widget.post!.profName + "'s Post", style: TextStyle(fontWeight: FontWeight.bold),),

                    Text(widget.post!.desc),

                    TextFormField(
                      readOnly: true,
                      initialValue: FirebaseAuth.instance.currentUser?.displayName,
                      decoration: const InputDecoration(
                          helperText: 'Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: FirebaseAuth.instance.currentUser?.email,
                      decoration: const InputDecoration(
                          helperText: 'Email Address'
                      ),
                    ),

                    TextField(
                      controller: wtController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Job Title'
                      ),
                    ),

                    TextField(
                      controller: wcController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Company Name'
                      ),
                    ),

                    TextField(
                      controller: wdController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Description'
                      ),
                    ),

                    TextField(
                      controller: wsdController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Start Date'
                      ),
                    ),

                    TextField(
                      controller: wedController,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: End Date'
                      ),
                    ),
                    TextField(
                      controller: wt2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Job Title'
                      ),
                    ),

                    TextField(
                      controller: wc2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Company Name'
                      ),
                    ),

                    TextField(
                      controller: wd2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Description'
                      ),
                    ),

                    TextField(
                      controller: wsd2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Start Date'
                      ),
                    ),

                    TextField(
                      controller: wed2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: End Date'
                      ),
                    ),

                    TextField(
                      controller: uController,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: School Name'
                      ),
                    ),

                    TextField(
                      controller: usdController,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Start Date'
                      ),
                    ),

                    TextField(
                      controller: uedController,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Graduation Date'
                      ),
                    ),

                    TextField(
                      controller: udController,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Degree'
                      ),
                    ),

                    TextField(
                      controller: umController,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Major'
                      ),
                    ),

                    TextField(
                      controller: gpaController,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: GPA'
                      ),
                    ),
                    TextField(
                      controller: u2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: School Name'
                      ),
                    ),

                    TextField(
                      controller: usd2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Start Date'
                      ),
                    ),

                    TextField(
                      controller: ued2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Graduation Date'
                      ),
                    ),

                    TextField(
                      controller: ud2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Degree'
                      ),
                    ),

                    TextField(
                      controller: um2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Major'
                      ),
                    ),

                    TextField(
                      controller: gpa2Controller,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: GPA'
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
                          helperText: 'LinkedIn URL'
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        apply(FirebaseAuth.instance.currentUser?.displayName, FirebaseAuth.instance.currentUser?.email, wtController.text, wcController.text, wdController.text,
                        wsdController.text, wedController.text, uController.text, usdController.text, uedController.text,
                        udController.text, umController.text, gpaController.text, sController.text, linController.text,wt2Controller.text, wc2Controller.text, wd2Controller.text,
                            wsd2Controller.text, wed2Controller.text, u2Controller.text, usd2Controller.text, ued2Controller.text,
                            ud2Controller.text, um2Controller.text, gpa2Controller.text);
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