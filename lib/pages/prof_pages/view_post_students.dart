import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:thoughtify/models/post.dart';
import 'package:thoughtify/models/short_resume.dart';

class ViewPostStudents extends StatefulWidget {
  const ViewPostStudents({Key? key, required this.post}) : super(key: key);
  _ViewPostStudentsState createState() => _ViewPostStudentsState();
  final Post? post;
}

class _ViewPostStudentsState extends State<ViewPostStudents> {
  List<ShortResume> students = <ShortResume>[];

  @override
  Widget build(BuildContext context) {
    // TODO I'm not sure if it works to call this inside build
    Stream<QuerySnapshot> _postsStream =
      FirebaseFirestore.instance.collection('posts')
        .doc(widget.post!.id).collection('students').snapshots();

    return StreamBuilder<QuerySnapshot> (
        stream: _postsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          students.clear();
          for (var student in snapshot.data!.docs) {
            students.add(
                ShortResume(student.id, student["name"], student["email"], student["latest_job_title"],
                    student["latest_job_company"], student["latest_work_start_date"],
                    student["latest_work_end_date"], student["latest_school_name"],
                    student["latest_school_start_date"], student["latest_school_grad_date"],
                    student["latest_school_degree"], student["latest_school_major"],
                    student["latest_school_gpa"], student["skills"], student["linkedin_url"],
                    student["num_jobs"], student["num_schools"]));
          }

          // TODO: implement return w UI
          throw UnimplementedError();
        }
    );
  }

}