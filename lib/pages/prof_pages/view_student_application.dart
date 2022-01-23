import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/submission.dart';

class ViewStudentSubmission extends StatefulWidget {
  const ViewStudentSubmission({Key? key, required this.submission}) : super(key: key);
  _ViewStudentSubmissionState createState() => _ViewStudentSubmissionState();
  final Submission? submission;
}

class _ViewStudentSubmissionState extends State<ViewStudentSubmission> {
  final ScrollController _scrollController = ScrollController();
  final CollectionReference submissions = FirebaseFirestore.instance.collection('submissions');

  void deny() {
    //TODO: implement this with db

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.submission!.name + "'s Application"),
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
                      initialValue: widget.submission!.name,
                      decoration: const InputDecoration(
                          helperText: 'Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.studentEmail,
                      decoration: const InputDecoration(
                          helperText: 'Email Address'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w1Title,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Job Title'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w1Company,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Company Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w1Desc,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Description'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w1Start,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: Start Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w1End,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 1: End Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w2Title,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Job Title'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w2Company,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Company Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w2Desc,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Description'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w2Start,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: Start Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.w2End,
                      decoration: const InputDecoration(
                          helperText: 'Work Experience 2: End Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e1Name,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: School Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e1Start,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Start Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e1Grad,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Graduation Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e1Degree,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Degree'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e1Major,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: Major'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e1GPA,
                      decoration: const InputDecoration(
                          helperText: 'Education 1: GPA'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e2Name,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: School Name'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e2Start,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Start Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e2Grad,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Graduation Date'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e2Degree,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Degree'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e2Major,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: Major'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.e2GPA,
                      decoration: const InputDecoration(
                          helperText: 'Education 2: GPA'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.skills,
                      decoration: const InputDecoration(
                          helperText: 'Skills'
                      ),
                    ),

                    TextFormField(
                      readOnly: true,
                      initialValue: widget.submission!.linkedInUrl,
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
                            submissions.doc(widget.submission?.id)
                                .update({'application_status': 'deny'});
                            Navigator.pop(context);
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
                            submissions.doc(widget.submission?.id)
                            .update({'application_status': 'accepted'});
                            Navigator.pop(context);
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