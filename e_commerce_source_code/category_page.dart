// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:demo/services/storage_services.dart';

import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List _categoryList = [
    ["Hair Cut", "hair_cut.png"],
    ["Makeup", "makeup.png"],
    ["Straightening", "straightening.png"],
    ["Mani-Pedi", "mani_pedi.png"],
    ["Spa/Massage", "spa_massage.png"],
    ["Beard Trimming", "beard_trimming.png"],
    ["Hair Coloring", "hair_colouring.png"],
    ["Waxing", "waxing.png"],
    ["Facial", "facial.png"],
  ];

  @override
  Widget build(BuildContext context) {
    final FirebaseStorage storage = FirebaseStorage();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Catetory",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),

        //*
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 9,
          itemBuilder: (context, index) {
            return FutureBuilder(
                future: storage.downloadUrl(_categoryList[index][1]),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Stack(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(20.0),
                            padding: EdgeInsets.all(18.0),
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Image.network(snapshot.data!)),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                                child: Text(
                              _categoryList[index][0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 13),
                            )),
                          ],
                        ),
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.grey,
                    ));
                  }
                  return Container();
                });
          },
        ));
  }
}
