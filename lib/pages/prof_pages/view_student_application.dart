import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/resume.dart';

class ViewStudentApplication extends StatefulWidget {
  const ViewStudentApplication({Key? key, required this.student}) : super(key: key);
  _ViewStudentApplicationState createState() => _ViewStudentApplicationState();
  final Submission? student;
}

class _ViewStudentApplicationState extends State<ViewStudentApplication> {
  final ScrollController _scrollController = ScrollController();

  void accept() {
    //TODO: implement this with db

    Navigator.pop(context);
  }

  void deny() {
    //TODO: implement this with db

    Navigator.pop(context);
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

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.name,
                      decoration: const InputDecoration(
                          helperText: 'Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.studentEmail,
                      decoration: const InputDecoration(
                          helperText: 'Email Address'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w1Title,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Job Title'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w1Company,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Company Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w1Desc,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Description'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w1Start,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Start Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w1End,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: End Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w2Title,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Job Title'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w2Company,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Company Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w2Desc,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Description'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w2Start,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Start Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.w2End,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: End Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e1Name,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: School Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e1Start,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Start Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e1Grad,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Graduation Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e1Degree,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Degree'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e1Major,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Major'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e1GPA,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: GPA'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e2Name,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: School Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e2Start,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Start Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e2Grad,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Graduation Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e2Degree,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Degree'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e2Major,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Major'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.e2GPA,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: GPA'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.skills,
                      decoration: const InputDecoration(
                          helperText: 'Skills'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.student!.linkedInUrl,
                      decoration: const InputDecoration(
                          helperText: 'LinkedIn URL'
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,),
                          onPressed: () {
                            deny();
                          },
                          child: const Text('Deny'),
                        ),

                        const SizedBox(
                          width: 15,
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,),
                          onPressed: () {
                            accept();
                          },
                          child: const Text('Accept'),
                        ),
                      ],
                    ),
                  ],
                ),)
          )
      ),
    );
  }

}