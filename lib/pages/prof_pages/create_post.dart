import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  void createPost(String title, String description) {
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.add({
      'prof_email': FirebaseAuth.instance.currentUser?.email,
      'prof_name': FirebaseAuth.instance.currentUser?.displayName,
      'title': title,
      'desc': description
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}