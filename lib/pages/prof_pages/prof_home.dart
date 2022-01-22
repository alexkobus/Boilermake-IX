import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:thoughtify/models/post.dart';

class ProfHome extends StatefulWidget {
  const ProfHome({Key? key}) : super(key: key);
  _ProfStateHome createState() => _ProfStateHome();
}

class _ProfStateHome extends State<ProfHome> {
  final Stream<QuerySnapshot> _postsStream =
    FirebaseFirestore.instance.collection('posts').snapshots();
  List<Post> myPosts = <Post>[];

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot> (
      stream: _postsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          myPosts.clear();
          for (var post in snapshot.data!.docs) {
            if (post["prof_email"] ==
                FirebaseAuth.instance.currentUser?.email) {
              myPosts.add(
                  Post(post["prof_email"], post["prof_name"], post["title"], post["desc"]));
            }
          }

          // TODO: implement return w UI
          throw UnimplementedError();
        }
    );
  }

}