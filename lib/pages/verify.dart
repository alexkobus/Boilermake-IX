import 'package:flutter/material.dart';
import 'package:thoughtify/helpers/tokens.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key, required this.errorState}) : super(key: key);
  _VerifyState createState() => _VerifyState();
  final bool errorState;
}

class _VerifyState extends State<Verify> {
  final ScrollController _scrollController = ScrollController();
  final vController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    vController.dispose();
    super.dispose();
  }

  _VerifyState();

  void initState() {
    super.initState();
  }

  void checkCode(String? code) {


    //TODO: check if user is student or prof, go to correct page
    Navigator.popAndPushNamed(context, "/student_home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Phone Number"),
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
                      child: (widget.errorState)
                          ? const Text("Incorrect Verification Code",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    const Text("We have just texted you a verification code."),

                    const SizedBox(
                      height: 15,
                    ),

                    const Text("Enter your verification code below."),

                    TextField(
                      controller: vController,
                      decoration: const InputDecoration(
                          helperText: 'Verification Code'
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Back'),
                        ),

                        const SizedBox(
                          width: 15,
                        ),

                        ElevatedButton(
                          onPressed: () {
                            checkCode(vController.text);
                          },
                          child: const Text('Verify'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          )
      ),
    );
  }
}