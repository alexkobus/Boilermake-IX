import 'package:flutter/material.dart';
import 'package:thoughtify/models/post.dart';
import 'package:thoughtify/models/user.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final ScrollController _scrollController = ScrollController();
  List<Post> postList = <Post>[];

  _StudentHomeState();

  void initState() {
    super.initState();
    getPostList();
  }

  void getPostList() async {
    //TODO: get the post list from the database
    User profA = User("profA@univ.edu", "password", "Professor A", "Professor");
    User profB = User("profB@univ.edu", "password", "Professor B", "Professor");
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information1"));
    postList.add(Post(profB, "A long descrpition \n with multiple lines \n and information2"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information3"));
    postList.add(Post(profB, "A long descrpition \n with multiple lines \n and information4"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information5"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information6"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information7"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information8"));
    postList.add(Post(profB, "A long descrpition \n with multiple lines \n and information9"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information0"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information11"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information22"));
    postList.add(Post(profB, "A long descrpition \n with multiple lines \n and information33"));
    postList.add(Post(profA, "A long descrpition \n with multiple lines \n and information44"));
    return;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Homepage"),
        
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
                        title: Text(postList[index].prof.name),
                        subtitle: Text(postList[index].desc),
                      );
                    }),)
          )
      ),
    );
  }
}