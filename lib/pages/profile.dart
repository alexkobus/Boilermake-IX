import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/models/user.dart';

class Profile extends StatefulWidget {

  const Profile({Key? key,}) : super(key: key);
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ScrollController _scrollController = ScrollController();

  get height => null;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
    UserStuff myUser = UserStuff("0", "Error loading user info", "", "", "+11111111111");
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data != null) {
            for (var doc in snapshot.data!.docs) {
              if (doc["email"] == FirebaseAuth.instance.currentUser?.email) {
                myUser = UserStuff(doc.id, doc["email"], doc["name"], doc["role"], doc["phone"]);
                break;
              }
            }
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("User Profile"),
            ),

            body: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text("Name: " + myUser.name),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text("Email: " + myUser.email),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text("Phone Number: " + myUser.phone),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text("Role: " + myUser.role),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}