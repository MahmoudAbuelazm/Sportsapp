import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubit/Leagues%20Cubit/leagues_cubit.dart';
import 'package:sports_app/Data/Cubit/cubit/git_country_cubit.dart';

class LeaguesScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var response2;
  LeaguesScreen({super.key, required this.response2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black, // Make the AppBar background transparent
        title: Padding(
          padding: const EdgeInsets.all(70),
          child: Row(
            children: [
              Image.network(
                "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjpljOWcxImIeXCBZ4r8l1wVUgt79Z8WA4sXbUIJ0VeKByQlHb2VT1imAM2rPjo9XH5rsPES4jCqf_WQwMKO1p-Y7qziqFvDvjmcW4Qy0j81UJPqMtB1xf8hAiKEuvnFdlpKX_ZLpSaYiRLWVbCspcZ1NdjIzEArGLRKdJKSM6GIR1g5Bjj5hpvrOd4/s1600/all%20new%20italy%20logo%20%285%29.jpg", // Replace with the path to your Italy image
                height: 30, // Adjust the height as needed
                width: 30, // Adjust the height as needed
              ),
              const Text(
                "Italy",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            // Define the action you want to perform when the arrow is pressed.
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // vatedButton(
            //     onPressed: () async {
            //       context.read<LeaguesCubit>().getAllLeagues("5");
            //     },
            //     child: Text("Get Updated News")),

            BlocBuilder<LeaguesCubit, LeaguesState>(
              builder: (context, state) {
                if (state is LeaguesInitial) {
                  return Center(
                    child: Text("Please press the button to get news"),
                  );
                } else if (state is LeaguesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LeaguesSuccess) {
                  var leaguesList = state.response.result;
                  return Stack(
                    children: [
                      // Background Image
                      Positioned.fill(
                        child: Image.asset(
                          "Images/Background.png",
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: state.response.result.length,
                          itemBuilder: (context, index) {
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      1 /
                                      17,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,

                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image(
                                          image: NetworkImage(state.response
                                                  .result[index].leagueLogo ??
                                              'https://cdn.alweb.com/thumbs/egyptencyclopedia/article/fit710x532/%D8%B9%D9%84%D9%85-%D9%85%D8%B5%D8%B1-%D8%A3%D9%87%D9%85-%D8%A7%D9%84%D8%AD%D9%82%D8%A7%D8%A6%D9%82.jpg'),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          (leaguesList[index].leagueName)
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrone"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
