// ignore_for_file: unnecessary_this, prefer_const_constructors, unnecessary_null_comparison, use_build_context_synchronously, unnecessary_string_escapes, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unused_catch_clause

import 'package:demo/auth/verify_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _numberController = TextEditingController();

  String warning = "";

  Future signIn() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + _numberController.text,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: (String verifyId, int? token) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyIdScreen(verifyId: verifyId),
              ));
        },
        codeAutoRetrievalTimeout: (e) {},
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        warning = "error! Not Registerd or Check connection";
      });
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Stack(
            children: [
              // inner stack layer
              Column(
                children: [
                  Image.asset('assets_images/app_logo.jpeg'),
                  SizedBox(height: 40),

                  // Phone textfield section
                  Container(
                    height: 370,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Container(
                            height: 320,
                            margin:
                                EdgeInsets.only(top: 50, left: 20, right: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(height: 20),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: _numberController,
                                      keyboardType: TextInputType.number,
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        suffixIcon:
                                            Icon(Icons.phone_in_talk_outlined),
                                        suffixIconColor: Colors.grey.shade400,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade100),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.deepPurple),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        hintText: "Enter Mobile Number",
                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  warning,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10),
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: signIn,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 0, 63, 114),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                          child: Text(
                                            "CONTINUE",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text("By continuing you are agree to our"),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Terms & Conditions ",
                                            style: TextStyle(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Text("and "),
                                          Text(
                                            "Privacy Policy",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )
                                        ])
                                  ],
                                ),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.11),
                                        blurRadius: 45,
                                        spreadRadius: 0.0),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(45)),
                              child: Center(
                                child: Image(
                                    image:
                                        AssetImage("assets_images/user.png")),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40.0),
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),

              // outer stack layer
            ],
          )),
        ));
  }
}
