import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/post.dart';
import 'package:thoughtify/models/resume.dart';
import 'package:thoughtify/pages/prof_pages/view_student_application.dart';

class ViewApplicants extends StatefulWidget {
  const ViewApplicants({Key? key, required this.post}) : super(key: key);
  _ViewApplicantsState createState() => _ViewApplicantsState();
  final Post? post;
}

class _ViewApplicantsState extends State<ViewApplicants> {
  List<Submission> students = <Submission>[];

  final ScrollController _scrollController = ScrollController();

  final Stream<QuerySnapshot> _submissionsStream =
    FirebaseFirestore.instance.collection('submissions').snapshots();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot> (
        stream: _submissionsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          students.clear();
          if (snapshot.data != null) {
            for (var student in snapshot.data!.docs) {
              if (student["post"] == widget.post?.id){
                ApplicationStatus status = ApplicationStatus.underReview;
                if (student["application_status"] == "accepted") {
                  status = ApplicationStatus.accepted;
                } else if (student["application_status"] == "under_review") {
                  status = ApplicationStatus.underReview;
                } else if (student["application_status"] == "denied") {
                  status = ApplicationStatus.denied;
                }
                students.add(Submission(
                    student.id,
                    student["name"],
                    student["email"],
                    student["w1_title"],
                    student["w1_company"],
                    student["w1_start"],
                    student["w1_end"],
                    student["w1_desc"],
                    student["w2_title"],
                    student["w2_company"],
                    student["w2_start"],
                    student["w2_end"],
                    student["w2_desc"],
                    student["e1_name"],
                    student["e1_start"],
                    student["e1_grad"],
                    student["e1_degree"],
                    student["e1_major"],
                    student["e1_gpa"],
                    student["e2_name"],
                    student["e2_start"],
                    student["e2_grad"],
                    student["e2_degree"],
                    student["e2_major"],
                    student["e2_gpa"],
                    student["skills"],
                    student["linkedin_url"],
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
                          itemCount: students.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(students[index].name),
                              subtitle: Text(students[index].w1Title + "\n"
                              + students[index].w1Desc),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewStudentApplication(student: students[index],)));
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