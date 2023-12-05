// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';

class MyPopUp extends StatefulWidget {
  File selectedImage;
  String framePath;
  MyPopUp({
    required this.framePath,
    required this.selectedImage,
    super.key,
  });

  @override
  State<MyPopUp> createState() => _MyPopUpState();
}

class _MyPopUpState extends State<MyPopUp> {
  void _selectFramePath(String path) {
    setState(() {
      widget.framePath = path;
    });
  }

  Widget _buildImageWithFrame() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.file(
          widget.selectedImage,
          width: 400,
          height: 400,
          fit: BoxFit.cover,
        ),
        ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors
                  .white, // Set the color you want to use as a filter (transparent for no color)
              BlendMode.srcOut,
            ),
            child: Image.asset(
              widget.framePath,
              width: 400,
              height: 400,
              fit: BoxFit.fill,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
          child: Container(
        height: 500,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  "Uploaded Image",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 20,
                      fontFamily: 'italic'),
                ),
              ),
              SizedBox(
                height: 300,
                child: _buildImageWithFrame(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Add your four frame images here
                  GestureDetector(
                    onTap: () {
                      _selectFramePath("assets/frame0.png");
                    },
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Orginal",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectFramePath('assets/frame1.png');
                    },
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          'assets/frame1.png',
                        )),
                  ),

                  GestureDetector(
                    onTap: () {
                      _selectFramePath('assets/frame2.png');
                    },
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          'assets/frame2.png',
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectFramePath('assets/frame3.png');
                    },
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          'assets/frame3.png',
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectFramePath('assets/frame4.png');
                    },
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0, color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          'assets/frame4.png',
                        )),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, widget.framePath);
                },
                child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xff088079),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      'Use This Image',
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.cancel,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              )
            ],
          )
        ]),
      )),
    );
  }
}
