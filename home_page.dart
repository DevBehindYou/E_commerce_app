// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields, sized_box_for_whitespace, unused_field

import 'package:demo/services/storage_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseStorage storage = FirebaseStorage();
  final _controller = TextEditingController();

  List _listOne = [
    "beard.jpg",
    "trimming.jpg",
    "haircut.jpg",
  ];
  List _listTwo = [
    "barbershopcrop.jpg",
    "curling.jpg",
    "hairdressercrop.jpg",
  ];
  List _listTree = [
    "Beard Trimming",
    "Hair Straightener",
    "Splendid",
  ];
  List _listPriceOne = [
    ["Rs 200", "Rs 300"],
    ["Rs 1000", "Rs 2100"],
    ["Rs 1000", "Rs 1600"],
  ];
  List _categoryList = [
    ["Hair Cut", "hair_cut.png"],
    ["Makeup", "makeup.png"],
    ["Straightening", "straightening.png"],
    ["Mani-Pedi", "mani_pedi.png"],
    ["Spa/Massage", "spa_massage.png"],
    ["Beard Trimming", "beard_trimming.png"],
  ];
  List _listFour = [
    "trimmingcrop.jpg",
    "hairdressercrop.jpg",
    "haircutcrop.jpg",
  ];
  List _listText = [
    "All",
    "Haircuts",
    "Make up",
    "Manicure",
    "Trimming",
  ];
  List _listFive = [
    ["Tanishk Unisex Salon", "Jankpuri, New Delhi"],
    ["Royal Touch Salon Studio", "Tilak Nagar, New Delhi"],
    ["Hair Direction Salon", "Tilak Nagar, New Delhi"],
  ];
  List _listSix = [
    "1.2km",
    "800m",
    "900m",
  ];
  List _listSeven = [
    ["4.8", "256 Reviews"],
    ["4.6", "156 Reviews"],
    ["4.6", "154 Reviews"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            // body of the home page
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // name section
                  Row(
                    children: [
                      FutureBuilder(
                          future: storage.downloadUrl("Portrait.jpg"),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                height: 45,
                                width: 45,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(snapshot.data!),
                                ),
                              );
                            }
                            if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                !snapshot.hasData) {
                              return Center(
                                  child: CircularProgressIndicator(
                                color: Colors.grey,
                              ));
                            }
                            return Container();
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Good Morning",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                          ),
                          Text(
                            "Sushma Shukla",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: Image(
                            image: AssetImage(
                          "assets_images/bell.png",
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 35,
                        child: Image(
                            image: AssetImage(
                          "assets_images/tag.png",
                        )),
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),

            // search bar
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: EdgeInsets.all(12.0),
                      height: 15,
                      width: 15,
                      child: Image(
                        image: AssetImage("assets_images/search.png"),
                        color: Colors.grey.shade400,
                      ),
                    ),
                    suffixIcon: Container(
                      padding: EdgeInsets.all(12.0),
                      height: 15,
                      width: 15,
                      child: Image(
                        image: AssetImage("assets_images/setting.png"),
                        color: Colors.grey,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),
              ),
            ),

            // style images with listOne
            Container(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                        future: storage.downloadUrl(_listOne[index]),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return InkWell(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 340,
                                    margin: EdgeInsets.only(left: 30, top: 40),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(snapshot.data!),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 45),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(17),
                                          ),
                                          child: Text(
                                            "30% OFF",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Today's Special",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Get a diacount for every service order!\nonly valid for today!",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              !snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Container();
                        });
                  },
                )),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Featured Services",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),

            // featured service section
            Container(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                        future: storage.downloadUrl(_listTwo[index]),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return InkWell(
                              child: Container(
                                  width: 150,
                                  margin: EdgeInsets.only(
                                    left: 30,
                                    top: 40,
                                    bottom: 30,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.11),
                                            blurRadius: 40,
                                            spreadRadius: 0.0),
                                      ]),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                                  topStart: Radius.circular(15),
                                                  topEnd: Radius.circular(15)),
                                          child: Image.network(
                                            snapshot.data!,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              _listTree[index],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  _listPriceOne[index][0],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  _listPriceOne[index][1],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                            );
                          }
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              !snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Container();
                        });
                  },
                )),

            //category list

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    "View All",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),

            Container(
              height: 300,
              color: Colors.white,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                      future: storage.downloadUrl(_categoryList[index][1]),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<String> snapshot,
                      ) {
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
                                  child: Center(
                                      child: Image.network(snapshot.data!)),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                      child: Text(
                                    _categoryList[index][0],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  )),
                                ],
                              ),
                            ],
                          );
                        }
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            !snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Container();
                      });
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Most Popular Services",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          _listText[index],
                          style: TextStyle(
                              color: Colors.blue.shade800,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 520,
              color: Colors.white,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return FutureBuilder(
                      future: storage.downloadUrl(_listFour[index]),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<String> snapshot,
                      ) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return Container(
                            margin:
                                EdgeInsets.only(left: 30, right: 30, top: 20),
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 130,
                                  width: 130,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(snapshot.data!),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _listFive[index][0],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 7),
                                        Text(
                                          _listFive[index][1],
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.blue.shade800,
                                          size: 18,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          _listSix[index],
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade500,
                                          size: 20,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          _listSeven[index][0],
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 12),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "| " + _listSeven[index][1],
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image(
                                        image:
                                            AssetImage("assets_images/tag.png"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            !snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Container();
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
