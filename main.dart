// ignore_for_file: prefer_const_constructors
import 'package:demo/firebase_options.dart';
import 'package:demo/auth/wrapper.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
      routes: ({
        '/homepage': (context) => HomePage(),
        '/wrapper': (context) => Wrapper(),
        '/mainpage': (context) => MainPage(),
      }),
    );
  }
}
