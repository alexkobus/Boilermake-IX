import 'package:flutter/material.dart';
import 'package:thoughtify/models/resume.dart';
import 'package:thoughtify/pages/import_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:thoughtify/models/post.dart';
import 'package:thoughtify/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thoughtify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => Login(errorState: false),
        "/default": (context) => MyHomePage(title: "default"),
        "/loginError": (context) => Login(errorState: true),
        "/signup": (context) => Signup(errorState: 0),
        "/signupError": (context) => Signup(errorState: 1),
        "/signupErrorEmail": (context) => Signup(errorState: 2),
        "/signupErrorPass": (context) => Signup(errorState: 3),
        "/signupErrorPhone": (context) => Signup(errorState: 4),
        "/student_home": (context) => StudentHome(),
        "/application": (context) => Application(post: Post("default ID - likely not on Firestore", "default@default.com","Professor", "default title", "default description")),
        "/statusAccepted": (context) => Status(acceptanceStatus: ApplicationStatus.accepted),
        "/statusInprogress": (context) => Status(acceptanceStatus: ApplicationStatus.underReview),
        "/statusdenied": (context) => Status(acceptanceStatus: ApplicationStatus.denied),
        "/profile": (context) => Profile(),
        "/verify": (context) => Verify(phoneNum: "+12222222222", errorState: false, role: "Student"),
        "/verifyError": (context) => Verify(phoneNum: "+12222222222", errorState: true, role: "Student"),
        "/prof_home": (context) => ProfHome(),
        "/viewApplicants": (context) => ViewApplicants(post: Post("default ID - likely not on Firestore", "default@default.com","Professor", "default title", "default description")),
        "/viewStudentApplication": (context) => ViewStudentApplication(student: null),
        "/createPost": (context) => CreatePost(),
      }
    );
  }
}
