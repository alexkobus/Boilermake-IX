import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final ScrollController _scrollController = ScrollController();

  _StudentHomeState();

  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Homepage"),
      ),

      body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Prof DEFAULT_VALUE"),
                        subtitle: Text("Details DEFAULT_VALUE"),
                      );
                    }),)
          )
      ),
    );
  }
}