import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/post.dart';

import 'application.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final ScrollController _scrollController = ScrollController();
  List<Post> postList = <Post>[];
  final Stream<QuerySnapshot> _postsStream =
      FirebaseFirestore.instance.collection('posts').snapshots();


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
            postList.add(Post(doc.id, doc["prof_email"], doc["prof_name"], doc["title"], doc["desc"]));
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
                            title: Text(postList[index].profName + " - " + postList[index].title),
                            subtitle: Text(postList[index].desc),
                            trailing: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Application(post: postList[index],)));
                              },
                              child: Text("Apply"),
                            ),
                          );
                        }),)
              )
          ),
        );
      }
    );
  }
}