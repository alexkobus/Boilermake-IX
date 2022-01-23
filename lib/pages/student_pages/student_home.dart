import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/post.dart';
import 'package:thoughtify/models/submission.dart';
import 'package:thoughtify/pages/import_pages.dart';

import 'application.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final ScrollController _scrollController = ScrollController();
  List<Post> postList = <Post>[];
  List<Submission> mySubmissions = <Submission>[];
  final Stream<QuerySnapshot> _postsStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  final Stream<QuerySnapshot> _submissionsStream =
      FirebaseFirestore.instance.collection('submissions').snapshots();

  _StudentHomeState();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _postsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          postList.clear();
          if (snapshot.data != null) {
            for (var doc in snapshot.data!.docs) {
              postList.add(Post(doc.id, doc["prof_email"], doc["prof_name"],
                  doc["title"], doc["desc"]));
            }
          }
          return StreamBuilder(
              stream: _submissionsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.data != null) {
                  for (var submission in snapshot.data!.docs) {
                    if (submission["email"] == FirebaseAuth.instance.currentUser?.email){
                      ApplicationStatus status = ApplicationStatus.underReview;
                      if (submission["application_status"] == "accepted") {
                        status = ApplicationStatus.accepted;
                      } else if (submission["application_status"] ==
                          "under_review") {
                        status = ApplicationStatus.underReview;
                      } else if (submission["application_status"] == "denied") {
                        status = ApplicationStatus.denied;
                      }
                      mySubmissions.add(Submission(
                          submission.id,
                          submission["post"],
                          submission["name"],
                          submission["email"],
                          submission["w1_title"],
                          submission["w1_company"],
                          submission["w1_start"],
                          submission["w1_end"],
                          submission["w1_desc"],
                          submission["w2_title"],
                          submission["w2_company"],
                          submission["w2_start"],
                          submission["w2_end"],
                          submission["w2_desc"],
                          submission["e1_name"],
                          submission["e1_start"],
                          submission["e1_grad"],
                          submission["e1_degree"],
                          submission["e1_major"],
                          submission["e1_gpa"],
                          submission["e2_name"],
                          submission["e2_start"],
                          submission["e2_grad"],
                          submission["e2_degree"],
                          submission["e2_major"],
                          submission["e2_gpa"],
                          submission["skills"],
                          submission["linkedin_url"],
                          status));
                      break;
                    }
                  }
                }
                return Scaffold(
                  appBar: AppBar(
                    title: Text("Student Homepage"),
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
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Scrollbar(
                            isAlwaysShown: true,
                            controller: _scrollController,
                            child: ListView.builder(
                                controller: _scrollController,
                                itemCount: postList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(postList[index].profName +
                                        " - " +
                                        postList[index].title),
                                    subtitle: Text(postList[index].desc),
                                    trailing: ElevatedButton(
                                      onPressed: () {
                                        bool submitted = false;
                                        for (Submission submission in mySubmissions) {
                                          if (submission.postId == postList[index].id) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Status(submission: submission)
                                              )
                                            );
                                            submitted = true;
                                            break;
                                          }
                                        }
                                        if (!submitted) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Application(
                                                        post: postList[index],
                                                      )));
                                        }
                                      },
                                      child: Text("Apply/View Status"),
                                    ),
                                  );
                                }),
                          ))),
                );
              });
        });
  }
}
