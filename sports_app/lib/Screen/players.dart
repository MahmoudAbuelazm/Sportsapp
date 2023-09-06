//import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubit/playersCubit/get_players_data_cubit.dart';
//import 'package:sports_app/Cubits/buttoncubit/cubit/button_cubit_cubit.dart';
//import 'package:sports_app/Data/cubits/fffff/cubit/get_players_data_cubit.dart';
//import 'package:sports_app/Data/model/git_players_data.dart';
//import 'package:sports_app/Data/reposetory/get_players_data_repo.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sports_app/Cubits/Button%20Cubits/cubit/button_cubits_cubit.dart';
// import 'package:sports_app/Screens/Dialog.dart';

class Players extends StatelessWidget {
  //String? player_name;

  // GetPlayersModel? ourfirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: ElevatedButton(
              onPressed: () {
                context.read<GetPlayersDataCubit>().gitPlayers();
              },
              child: Text("Press")),
        ),
        BlocBuilder<GetPlayersDataCubit, GetPlayersDataState>(
          builder: (context, state) {
            if (state is GetPlayersDataInitial) {
              return Text("Press");
            } else if (state is GetPlayersLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetPlayersSuccess) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Images/Background.png"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              //     color: Color(0xff000000),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Image(
                                    width: 38,
                                    height: 38,
                                    image: AssetImage(
                                        "Images/ep_arrow-left-bold.png")),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 130),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Image(
                                          width: 64,
                                          height: 80,
                                          image:
                                              AssetImage("Images/arsenal.png")),
                                    ),
                                    Text(
                                      "Arsenal",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 33,
                                        color: Colors.white,
                                        fontFamily: "Allerta",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                           
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          "SQUAD",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 33,
                            color: Colors.white,
                            fontFamily: "Allerta",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Divider(
                          color: Colors.white,
                          indent: 110,
                          endIndent: 110,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Allerta",
                                fontSize: 15,
                              ),
                            ),
                            hintText: "Enter Player Name",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Allerta",
                              fontSize: 15,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 35, 33, 44),
                                  width: 2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 159, 158, 159)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onChanged: (data) {
                            print(data);

                            // context.read<GetPlayersDataCubit>().gitPlayers();
                          },
                          
                          
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.response.result.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 400,
                               
                                
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "Images/Background.png"),
                                                      fit: BoxFit.cover)),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 50,
                                                            bottom: 15),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                      child: Image(
                                                          width: 83,
                                                          height: 83,
                                                          image: NetworkImage(
                                                            state
                                                                    .response
                                                                    .result[
                                                                        index]
                                                                    .playerImage ??
                                                                "https://thumbs.dreamstime.com/b/mo-salah-professional-footballer-vector-image-bandung-indonesia-march-mo-salah-professional-footballer-vector-image-242630646.jpg",
                                                          )),
                                                    ),
                                                  ),
                                                  Text(
                                                    state.response.result[index]
                                                            .playerName ??
                                                        "Mo.Salah",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        fontFamily: "Allerta",
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 50),
                                                    child: AlertDialog(
                                                      backgroundColor:
                                                          Color(0xff333333),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30.0)),
                                                      ),
                                                      content: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Player Details",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        "Allerta",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14,
                                                                    color: Color(
                                                                        0xffFFFFFF)),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            100),
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 60),
                                                            child: Divider(
                                                              thickness: 1,
                                                              color: Color(
                                                                  0xff000000),
                                                              indent: 0,
                                                              endIndent: 0,
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            65),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "From ",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Allerta",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              23,
                                                                          color:
                                                                              Color(0xffFFFFFF)),
                                                                    ),
                                                                    Text(
                                                                      state.response.result[index]
                                                                              .playerCountry ??
                                                                          "Egypt",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Allerta",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              23,
                                                                          color:
                                                                              Color(0xffFFFFFF)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 45,
                                                                    left: 20,
                                                                    right: 20),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              15),
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        state.response.result[index].playerAge ??
                                                                            "31",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Tahoma",
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontSize:
                                                                                19,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      Text(
                                                                        "Years",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Tahoma",
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      state.response.result[index].playerGoals ??
                                                                          "32",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              19,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "Goals",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      state.response.result[index]
                                                                              .playerNumber ??
                                                                          "2",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              19,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      " Number",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 45,
                                                                    left: 20,
                                                                    right: 20),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      state.response.result[index]
                                                                              .playerYellowCards ??
                                                                          "1",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              19,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "Yellow Card",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                 
                                                                  children: [
                                                                    Text(
                                                                      state.response.result[index]
                                                                              .playerRedCards ??
                                                                          "1",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              19,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "Red Cards",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Text(
                                                                      state.response.result[index]
                                                                              .playerAssists ??
                                                                          "Egyptian",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              19,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    Text(
                                                                      "Assits",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Tahoma",
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                    ),
                                    child: Container(
                                      height: 67,
                                      width: 375,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Color(0x2BC8C8C8),
                                            Color(0xFF2F0141),
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10),
                                        child: Row(
                                        
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image(
                                                  width: 47,
                                                  height: 47,
                                                  image: NetworkImage(
                                                    state.response.result[index]
                                                            .playerImage ??
                                                        "https://thumbs.dreamstime.com/b/mo-salah-professional-footballer-vector-image-bandung-indonesia-march-mo-salah-professional-footballer-vector-image-242630646.jpg",
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 90),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    state.response.result[index]
                                                            .playerName ??
                                                        "Mosalah",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        fontFamily: "Allerta",
                                                        fontSize: 20),
                                                  ),
                                                  Text(
                                                    state.response.result[index]
                                                            .playerType ??
                                                        "Coach",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff999999),
                                                        fontFamily: "Allerta",
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Text("Error");
            }
          },
        ),
      ]),
    );
  }
}
