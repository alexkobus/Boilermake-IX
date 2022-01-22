import 'package:flutter/material.dart';

class Status extends StatefulWidget {

  const Status({Key? key, required this.show}) : super(key: key);
  _StatusState createState() => _StatusState();
  final int show;
  //1 = Accepted
  //2 = In progress
  //3 = Denied
}

class _StatusState extends State<Status> {
  final ScrollController _scrollController = ScrollController();

  get height => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application Status"),
      ),

      body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: (widget.show == 1)
                          ? const Text("ACCEPTED!",
                        style: TextStyle(color: Colors.green, fontSize:32),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.show == 2)
                          ? const Text("In Progress",
                        style: TextStyle(fontSize:32),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.show == 3)
                          ? const Text("Denied",
                      style: TextStyle(color: Colors.red, fontSize: 32),
                      )
                          : null,
          )




                  ],
                ),)
          )
      ),
    );
  }
}