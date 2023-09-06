
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubit/Leagues%20Cubit/leagues_cubit.dart';

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        title: Padding(
          padding: const EdgeInsets.all(70),
          child: Row(
            children: [
              Image.network(
                "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjpljOWcxImIeXCBZ4r8l1wVUgt79Z8WA4sXbUIJ0VeKByQlHb2VT1imAM2rPjo9XH5rsPES4jCqf_WQwMKO1p-Y7qziqFvDvjmcW4Qy0j81UJPqMtB1xf8hAiKEuvnFdlpKX_ZLpSaYiRLWVbCspcZ1NdjIzEArGLRKdJKSM6GIR1g5Bjj5hpvrOd4/s1600/all%20new%20italy%20logo%20%285%29.jpg", // Replace with the path to your Italy image
                height: 30, // Adjust the height as needed
                width: 30, // Adjust the height as needed
              ),
              const SizedBox(
                width: 10,
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Define the action you want to perform when the arrow is pressed.
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
                onPressed: () async {
                  context.read<LeaguesCubit>().getAllLeagues("5");
                },
                child: Text("Get Updated News")),
            SizedBox(
              height: 30,
            ),
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
                  return SingleChildScrollView(
                    child: Stack(
                      children: [
                        // Background Image
                        Positioned.fill(
                          child: Image.asset(
                            "images/Background.png",
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: leaguesList!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      1 /
                                      17,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,

                                    // borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://1.bp.blogspot.com/-9K_H2KUU5io/XNgQ6olb3tI/AAAAAAAB7dk/qsB-gp7c-eYvieRFweWAXi2VQzIuGo2WgCLcBGAs/s1600/serie-a-logo-history%2B%25284%2529.jpg"),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Serie A"
                                              ,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
