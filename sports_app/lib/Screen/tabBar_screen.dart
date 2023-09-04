import 'package:flutter/material.dart';

class tabBarScreen extends StatelessWidget {
  tabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
        //  backgroundColor: Colors.transparent,
          appBar: AppBar(
         backgroundColor: Colors.black,
            title: Center(child: Text("League name ")),
            bottom: TabBar(indicatorColor: Colors.white,
             tabs: [
              Tab(
                child: Text("Teams"),
              ),
              Tab(
                child: Text("Top scores"),
              ),
            ]),
          ),
          body: Container(
            
            width: width,
            height: height,
            decoration: BoxDecoration(
             
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('Images/Background.png'))),
            child: TabBarView(children: [
              GridView(
                children: [
                  for (int i = 0; i < 18; i++)
                    Container(
                      width: width / 4,
                      height: width / 4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Images/pngwing.com.png"))),
                    ),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.white,
                          hintText: "search",
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          // border:
                        ),
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Column(
                        children: [
                          for (int i = 0; i < 100; i++)
                            Column(
                              children: [
                                Container(
                                  height: height / 20,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "player name",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "player team",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "goal num",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height / 30,
                                )
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}