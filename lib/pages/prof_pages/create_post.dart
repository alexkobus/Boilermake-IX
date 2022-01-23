import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final uController = TextEditingController();
  final pController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    uController.dispose();
    pController.dispose();
    super.dispose();
  }

  void createPost(String title, String description) {
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.add({
      'prof_email': FirebaseAuth.instance.currentUser?.email,
      'prof_name': FirebaseAuth.instance.currentUser?.displayName,
      'title': title,
      'desc': description
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a Post"),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                TextField(
                  controller: uController,
                  decoration: const InputDecoration(
                      helperText: 'Title'),
                ),

                TextField(
                  controller: pController,
                  decoration: const InputDecoration(helperText: 'Description'),
                ),

                ElevatedButton(
                  onPressed: () {
                    createPost(uController.text, pController.text);
                  },
                  child: const Text('Post'),
                ),
              ],
            ),
          )),
    );
  }
}