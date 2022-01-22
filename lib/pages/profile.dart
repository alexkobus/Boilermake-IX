import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/helpers/tokens.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

class Profile extends StatefulWidget {

  const Profile({Key? key,}) : super(key: key);
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ScrollController _scrollController = ScrollController();

  get height => null;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment_ind),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/profile");
            },
          ),
        ],
      ),

      body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text("Name"), Text(FirebaseAuth.instance.currentUser?.displayName),
                    // Text("Email"), Text(FirebaseAuth.instance.currentUser?.email),
                    //TODO
                    //Text("Phone Number"), Text(FirebaseAuth.instance.currentUser?.  )
                    //TODO
                    //Text("Role"), Text(FirebaseAuth.instance.currentUser?.  )


                  ],
                ),)
          )
      ),
    );
  }
}