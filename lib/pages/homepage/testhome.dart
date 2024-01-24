import 'package:flutter/material.dart';
import 'package:soundescape/pages/homepage/cardModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;
  var array = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bk.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  "Hey,Sarah1",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Listen. Focus. Unwind.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),

                /// card
                ///
                Container(
                  height: height,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(7),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 79,
                              width: 150,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                image: DecorationImage(
                                  opacity: 1,
                                  image: AssetImage(demo_data[index].image),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  size: 40,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                demo_data[index].listners,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      isVisible = !isVisible;
                                    });
                                  },
                                  icon: Icon(
                                    isVisible
                                        ? Icons.arrow_drop_down
                                        : Icons.arrow_drop_down_circle_outlined,
                                  ),
                                ),
                              ],
                            ),
                            if (isVisible)
                              Visibility(
                                child: Text(demo_data[index].desc),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                //card try

                Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset("assets/study.png"),
                        Text("4.5k Listners"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Fitness"),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(Icons.arrow_drop_down))
                          ],
                        ),
                        if (isVisible)
                          Visibility(
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                          )
                      ],
                    ),
                  ),
                ),

                // gridview.extend
              ],
            ),
          ),
        ),
      ),
    );
  }
}
