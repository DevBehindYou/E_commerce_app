// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, empty_catches, use_build_context_synchronously, unused_catch_clause

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyIdScreen extends StatefulWidget {
  final String verifyId;

  VerifyIdScreen({
    required this.verifyId,
    super.key,
  });

  @override
  State<VerifyIdScreen> createState() => _VerifyIdScreenState();
}

class _VerifyIdScreenState extends State<VerifyIdScreen> {
  String? otpCode;
  String warning = "";

  void verifyOtp(BuildContext context, String userOtp) async {
    final cerd = PhoneAuthProvider.credential(
        verificationId: widget.verifyId, smsCode: userOtp);

    try {
      var response = await FirebaseAuth.instance
          .signInWithCredential(cerd)
          .timeout(Duration(seconds: 2));

      Navigator.pushReplacementNamed(context, '/mainpage');
    } on TimeoutException catch (e) {
      setState(() {
        warning = e.toString();
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        warning = e.toString();
      });
    }
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

                  // email textfield section
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
                                Pinput(
                                  onCompleted: (value) {
                                    setState(() {
                                      otpCode = value;
                                    });
                                  },
                                  length: 6,
                                  showCursor: true,
                                  defaultPinTheme: PinTheme(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(),
                                        color: Colors.grey.shade100),
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  warning,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10),
                                ),

                                // continue button
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        if (otpCode != null) {
                                          verifyOtp(context, otpCode!);
                                        } else {
                                          setState(() {
                                            warning = "Enter 6-Digit code";
                                          });
                                        }
                                      },
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

                                    // term and conditions
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
                                        blurRadius: 40,
                                        spreadRadius: 0.0),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(45)),
                              child: Center(
                                  child: Image(
                                      image: AssetImage(
                                          "assets_images/password.png"))),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),

              // skip button
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
