import 'package:flutter/material.dart';
import 'package:thoughtify/models/submission.dart';

class Status extends StatefulWidget {

  const Status({Key? key, required this.submission, }) : super(key: key);
  _StatusState createState() => _StatusState();
  final Submission submission;
}

class _StatusState extends State<Status> {
  final ScrollController _scrollController = ScrollController();

  get height => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application Status"),
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
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: (widget.submission.status == ApplicationStatus.accepted)
                          ? const Text("ACCEPTED!",
                        style: TextStyle(color: Colors.green, fontSize:32),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.submission.status == ApplicationStatus.underReview)
                          ? const Text("Under Review",
                        style: TextStyle(fontSize:32),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.submission.status == ApplicationStatus.denied)
                          ? const Text("Denied",
                      style: TextStyle(color: Colors.red, fontSize: 32),
                      )
                          : null,
          )




                  ],
                ),)
          )
      ),
    );
  }
}