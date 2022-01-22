import 'package:flutter/material.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        // "/": (context) => AddProject("prof", "desc")
        "/": (context) => Login(errorState: false),
        "/default": (context) => MyHomePage(title: "default"),
        "/loginError": (context) => Login(errorState: true),
        "/signup": (context) => Signup(errorState: 0),
        "/signupError": (context) => Signup(errorState: 1),
        "/signupErrorEmail": (context) => Signup(errorState: 2),
        "/signupErrorPass": (context) => Signup(errorState: 3),
        "/signupErrorPhone": (context) => Signup(errorState: 4),
        "/student_home": (context) => StudentHome(),
        "/application": (context) => Application(post: Post("default@default.com","Professor", "default title", "default description")),
      }
    );
  }
}
