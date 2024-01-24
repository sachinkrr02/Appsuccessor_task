import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:soundescape/pages/homepage/bottomNav.dart';
import 'package:soundescape/pages/homepage/cardModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int expandedIndex = -1;
  var array = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: bnb(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: height * 2.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bk1.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                child: Container(
                  height: height * 1.7,
                  child: Column(
                    children: [
                      Text(
                        "Hey,Sarah1",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Listen. Focus. Unwind.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        style: TextStyle(fontSize: 14),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Search Song Name",
                          hintStyle: TextStyle(fontWeight: FontWeight.w600),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          prefixIcon: const Icon(Icons.search_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Top Playlists",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),

                      //card try
                      Container(
                        height: height * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.transparent,
                        ),
                        child: AlignedGridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(96, 98, 155, 1),
                                      Color.fromRGBO(194, 187, 203, 1),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          demo_data[index].image,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Icon(
                                              Icons.play_arrow_rounded,
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        demo_data[index].listners,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          demo_data[index].title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              expandedIndex =
                                                  expandedIndex == index
                                                      ? -1
                                                      : index;
                                            });
                                          },
                                          icon: Icon(
                                            expandedIndex == index
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (expandedIndex == index)
                                      Visibility(
                                        child: Text(demo_data[index].desc),
                                      )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sleep Stories For You",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Row(
                              children: [
                                Text(
                                  "View More",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                )
                              ],
                            ),
                          )
                        ],
                      ),

                      Container(
                        height: 160,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 160,
                                width: 170,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/sleep.png"),
                                      fit: BoxFit.fill),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "The Young Scout",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "10k Listeners",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            "10 Mins",
                                            style: TextStyle(fontSize: 12),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Explore Different Sounds",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        height: 360,
                        child: ListView.builder(
                            itemCount: 3,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(255, 255, 255, 0.6),
                                          Color.fromRGBO(63, 2, 63, 1),
                                        ],
                                        stops: [0.0, 1.0],
                                        begin: FractionalOffset.topLeft,
                                        end: FractionalOffset.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Nature",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Text("2.5K listeners")
                                          ],
                                        ),
                                      ),
                                      Image(
                                          image:
                                              AssetImage("assets/fitness.png"))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),

              //sleep stories for you
            ],
          ),
        ));
  }
}
