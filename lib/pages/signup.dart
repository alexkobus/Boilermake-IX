import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thoughtify/helpers/tokens.dart';
import 'package:thoughtify/pages/verify.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key, required this.errorState}) : super(key: key);
  _SignupState createState() => _SignupState();
  final int errorState;
//0 = no error
//1 = Invalid Information
//2 = Email Error
//3 = Weak Password
//4 = Invalid Phone Number
}

class _SignupState extends State<Signup> {
  final ScrollController _scrollController = ScrollController();
  final pController = TextEditingController();
  final eController = TextEditingController();
  final nController = TextEditingController();
  final phController = TextEditingController();

  String selectedValue = "Student";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pController.dispose();
    eController.dispose();
    nController.dispose();
    phController.dispose();
    super.dispose();
  }

  _SignupState();

  void initState() {
    super.initState();
  }

  void validateInfo(String? password, String? email, String? name, String phoneNum, String role) async {
    if (password != null && password.length < 6) {
      Navigator.popAndPushNamed(context, "/signupErrorPass");
    }

    if (email != null && !RegExp(".+@.+[.].+").hasMatch(email)) {
      Navigator.popAndPushNamed(context, "/signupErrorEmail");
    }

    if (phoneNum != null && !RegExp("[+]1[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]").hasMatch(phoneNum)) {
      Navigator.popAndPushNamed(context, "/signupErrorPhone");
    }

    bool valid = false;

    if (password != null && email != null && name != null && phoneNum != null
        && phoneNum != "" && password != "" && email != "" && name != "") {
      TwilioPhoneVerify _twilioPhoneVerify;
      _twilioPhoneVerify = TwilioPhoneVerify (
          accountSid: Tokens.accountSID,
          authToken: Tokens.authToken,
          serviceSid: Tokens.serviceSID
      );
      // var twilioResponse =
      // await _twilioPhoneVerify.sendSmsCode(phoneNum);
      //
      // if (twilioResponse.successful== true)  {
      //   print("code sent");
      // } else {
      //   print(twilioResponse.errorMessage);
      // }
      // twilioResponse = await _twilioPhoneVerify.verifySmsCode(
      //     phone: phoneNum, code: 'code');
      //
      // if (twilioResponse.successful== true) {
      //   if (twilioResponse.verification?.status == VerificationStatus.approved) {
      //     print('Phone number is approved');
      //   } else {
      //     print('Invalid code');
      //   }
      // } else {
      //   print(twilioResponse.errorMessage);
      // }

      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseAuth.instance.currentUser?.updateDisplayName(name);
        CollectionReference users = FirebaseFirestore.instance.collection('users');
        users.add({
          'email': email,
          'name': name,
          'phone': phoneNum,
          'role': role
        });
        valid = true;
      } on FirebaseAuthException catch (e) {
        valid = false;
      } catch (e) {
        valid = false;
      }
    }

    if (valid == true) {
      print("USER CREATED");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Verify(phoneNum: phoneNum, errorState: false, role: role)));
    } else {
      Navigator.popAndPushNamed(context, "/signupError");
    }
  }

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Student"),value: "Student"),
      DropdownMenuItem(child: Text("Professor"),value: "Professor"),
    ];
    return menuItems;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an Account"),
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
                      child: (widget.errorState == 1)
                          ? const Text("Invalid Information",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 2)
                          ? const Text("Invalid Email Address:",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 2)
                          ? const SizedBox(
                        height: 10,
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 2)
                          ? const Text("Email address must be in the format",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 2)
                          ? const Text("\"email@example.com\"",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 3)
                          ? const Text("Invalid Password:",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 3)
                          ? const Text("Password must be at least 6 characters long.",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 4)
                          ? const Text("Invalid Phone Number:",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 4)
                          ? const Text("Phone number must be in the format",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    Container(
                      child: (widget.errorState == 4)
                          ? const Text("\"+1##########\"",
                        style: TextStyle(color: Colors.red),
                      )
                          : null,
                    ),

                    TextField(
                      controller: eController,
                      decoration: const InputDecoration(
                          helperText: 'Email Address'
                      ),
                    ),

                    TextField(
                      controller: pController,
                      decoration: const InputDecoration(
                          helperText: 'Password'
                      ),
                    ),

                    TextField(
                      controller: nController,
                      decoration: const InputDecoration(
                          helperText: 'Name'
                      ),
                    ),

                    TextField(
                      controller: phController,
                      decoration: const InputDecoration(
                          helperText: 'Phone Number'
                      ),
                    ),

                    DropdownButton(
                        value: selectedValue,
                        onChanged: (String? newValue){
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems
                    ),

                    ElevatedButton(
                      onPressed: () {
                        validateInfo(pController.text, eController.text, nController.text, phController.text, selectedValue);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),)
          )
      ),
    );
  }
}