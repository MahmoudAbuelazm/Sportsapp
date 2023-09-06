import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubit/GetTeamsCubit/cubit/get_teams_cubit.dart';
import 'package:sports_app/Data/Cubit/GetTopScorerCubit/cubit/get_top_scorer_cubit.dart';



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
            leading: IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              iconSize: 30,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              splashColor: Colors.blueGrey,
              onPressed: () {},
            ),
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
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
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<GetTeamsCubit>().GetTeams();
                            },
                            child: Text("press")),
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
                          ),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context.read<GetTopScorerCubit>().getTopScorer();
                            },
                            child: Text("press")),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: BlocBuilder<GetTeamsCubit, GetTeamsState>(
                            builder: (context, state) {
                              if (state is GetTeamsSuccess) {
                                return GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  itemCount: state.response.result.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Image.network(
                                          state.response.result[index].teamLogo,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return Center(child: Text("error"));
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: height / 5,
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<GetTopScorerCubit, GetTopScorerState>(
                  builder: (context, state) {
                    if (state is GetTopScorerSuccess) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: state.response.result.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      1 /
                                      15,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomRight,
                                          colors: [
                                        Colors.black,
                                        Color(0xFF1F0048),
                                      ])),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.response.result[index]
                                              .playerName,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          state.response.result[index].teamName,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          (state.response.result[index].goals)
                                              .toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Center(child: Text("error"));
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
