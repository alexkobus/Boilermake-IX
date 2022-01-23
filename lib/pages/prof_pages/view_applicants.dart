import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/post.dart';
import 'package:thoughtify/models/submission.dart';
import 'package:thoughtify/pages/prof_pages/view_student_application.dart';

class ViewApplicants extends StatefulWidget {
  const ViewApplicants({Key? key, required this.post}) : super(key: key);
  _ViewApplicantsState createState() => _ViewApplicantsState();
  final Post? post;
}

class _ViewApplicantsState extends State<ViewApplicants> {
  List<Submission> submissions = <Submission>[];

  final ScrollController _scrollController = ScrollController();

  final Stream<QuerySnapshot> _submissionsStream =
    FirebaseFirestore.instance.collection('submissions').snapshots();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot> (
        stream: _submissionsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          submissions.clear();
          if (snapshot.data != null) {
            for (var submission in snapshot.data!.docs) {
              if (submission["post"] == widget.post?.id){
                ApplicationStatus status = ApplicationStatus.underReview;
                if (submission["application_status"] == "accepted") {
                  status = ApplicationStatus.accepted;
                } else if (submission["application_status"] == "under_review") {
                  status = ApplicationStatus.underReview;
                } else if (submission["application_status"] == "denied") {
                  status = ApplicationStatus.denied;
                }
                submissions.add(Submission(
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
              }
            }
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("View Applicants"),
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
                          itemCount: submissions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(submissions[index].name),
                              subtitle: Text(submissions[index].w1Title + "\n"
                              + submissions[index].w1Desc),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewStudentSubmission(submission: submissions[index],)));
                                },
                                child: Text("View Application"),
                              ),
                            );
                          }),
                    )
                )
            ),
          );
        }
    );
  }

}