import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:thoughtify/models/post.dart';
import 'package:thoughtify/models/resume.dart';

class ViewPostStudents extends StatefulWidget {
  const ViewPostStudents({Key? key, required this.post}) : super(key: key);
  _ViewPostStudentsState createState() => _ViewPostStudentsState();
  final Post? post;
}

class _ViewPostStudentsState extends State<ViewPostStudents> {
  List<Resume> students = <Resume>[];

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
                Resume(student.id, student["name"], student["email"],
                    student["w1_title"], student["w1_company"], student["w1_start"],
                    student["w1_end"], student["w1_desc"],
                    student["w2_title"], student["w2_company"], student["w2_start"],
                    student["w2_end"], student["w2_desc"],
                    student["e1_name"], student["e1_start"], student["e1_grad"],
                    student["e1_degree"], student["e1_major"], student["e1_gpa"],
                    student["e2_name"], student["e2_start"], student["e2_grad"],
                    student["e2_degree"], student["e2_major"], student["e2_gpa"],
                    student["skills"], student["linkedin_url"], student["application_status"]));
          }

          // TODO: implement return w UI
          throw UnimplementedError();
        }
    );
  }

}