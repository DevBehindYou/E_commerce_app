// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables
import 'package:demo/pages/category_page.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/undefinedpages/calander_page.dart';
import 'package:demo/undefinedpages/chat_page.dart';
import 'package:demo/undefinedpages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List _pages = [
    // home page
    HomePage(),

    // category page
    CategoryPage(),

    // undefind pages
    CalanderPage(),
    ChatPage(),
    ProfilePage(),
  ];

  void goToPage(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // pages to show in body
      body: _pages[currentIndex],

      // bottom Navigation bar section
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.center,
            onTabChange: (index) => goToPage(index),
            backgroundColor: Colors.white,
            color: Colors.white,
            activeColor: const Color.fromARGB(255, 2, 72, 130),
            tabBackgroundColor: Colors.grey.shade100,
            gap: 10,
            padding: EdgeInsets.all(16.0),
            tabs: [
              GButton(
                icon: Icons.home_rounded,
                iconColor: Colors.grey[700],
              ),
              GButton(
                icon: Icons.category_rounded,
                iconColor: Colors.grey[700],
              ),
              GButton(
                icon: Icons.calendar_month_outlined,
                iconColor: Colors.grey[700],
              ),
              GButton(
                icon: Icons.chat_bubble_outline_rounded,
                iconColor: Colors.grey[700],
              ),
              GButton(
                icon: Icons.person_2_rounded,
                iconColor: Colors.grey[700],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
