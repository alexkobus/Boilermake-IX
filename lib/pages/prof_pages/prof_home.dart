import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/post.dart';
import 'package:thoughtify/pages/prof_pages/view_applicants.dart';

class ProfHome extends StatefulWidget {
  const ProfHome({Key? key}) : super(key: key);
  _ProfHomeState createState() => _ProfHomeState();
}

class _ProfHomeState extends State<ProfHome> {
  final ScrollController _scrollController = ScrollController();

  final Stream<QuerySnapshot> _postsStream =
    FirebaseFirestore.instance.collection('posts').snapshots();
  List<Post> myPosts = <Post>[];

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot> (
      stream: _postsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          myPosts.clear();
          if (snapshot.data != null) {
            for (var post in snapshot.data!.docs) {
              if (post["prof_email"] ==
                  FirebaseAuth.instance.currentUser?.email) {
                myPosts.add(
                    Post(post.id, post["prof_email"], post["prof_name"], post["title"], post["desc"]));
              }
            }
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("Your Posts"),
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
                          itemCount: myPosts.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(myPosts[index].profName + " - " + myPosts[index].title),
                              subtitle: Text(myPosts[index].desc),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewApplicants(post: myPosts[index],)));
                                },
                                child: Text("View Applicants"),
                              ),
                            );
                          }),
                    )
                )
            ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/createPost");
                },
                child: const Icon(Icons.add),
              )
          );
        }
    );
  }

}