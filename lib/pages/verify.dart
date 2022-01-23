import 'package:flutter/material.dart';
import 'package:thoughtify/helpers/tokens.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key, required this.phoneNum, required this.errorState, required this.role}) : super(key: key);
  _VerifyState createState() => _VerifyState();
  final String phoneNum;
  final bool errorState;
  final String role;
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
    // sendMSG();
  }

  //TODO

  // Future<void> sendMSG() async {
  //   TwilioPhoneVerify _twilioPhoneVerify;
  //   _twilioPhoneVerify = TwilioPhoneVerify (
  //       accountSid: Tokens.accountSID,
  //       authToken: Tokens.authToken,
  //       serviceSid: Tokens.serviceSID
  //   );
  //
  //   var twilioResponse =
  //       await _twilioPhoneVerify.sendSmsCode(widget.phoneNum);
  //
  //   if (twilioResponse.successful== true)  {
  //     print("code sent");
  //   } else {
  //     print(twilioResponse.errorMessage);
  //   }
  // }

  Future<void> checkCode(String code) async {
    TwilioPhoneVerify _twilioPhoneVerify;
    _twilioPhoneVerify = TwilioPhoneVerify (
        accountSid: Tokens.accountSID,
        authToken: Tokens.authToken,
        serviceSid: Tokens.serviceSID
    );

    var twilioResponse = await _twilioPhoneVerify.verifySmsCode(
        phone: widget.phoneNum, code: code);

    if (twilioResponse.successful== true) {
      if (twilioResponse.verification?.status == VerificationStatus.approved) {
        print('Phone number is approved');

        if (widget.role.compareTo("Professor") == 0) {
          Navigator.popAndPushNamed(context, "/prof_home");

        } else if (widget.role.compareTo("Student") == 0) {
          Navigator.popAndPushNamed(context, "/student_home");
        }

      } else {
        print('Invalid code');
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify(phoneNum: widget.phoneNum, errorState: true, role: widget.role)));
      }
    } else {
      print(twilioResponse.errorMessage);
    }
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

                    Container(
                      child: (widget.errorState)
                          ? const SizedBox(
                        height: 15,
                      )
                          : null,
                    ),

                    const Text("We have just texted you a verification code."),

                    const SizedBox(
                      height: 15,
                    ),

                    const Text("Enter your 6 digit verification code below."),

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
                            // if (widget.role.compareTo("Professor") == 0) {
                            //   Navigator.popAndPushNamed(context, "/prof_home");
                            //
                            // } else if (widget.role.compareTo("Student") == 0) {
                            //   Navigator.popAndPushNamed(context, "/student_home");
                            // }
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