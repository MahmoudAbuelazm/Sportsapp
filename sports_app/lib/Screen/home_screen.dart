import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app/Screen/country_screen.dart';
import 'package:sports_app/main.dart';
import 'package:lottie/lottie.dart';

import '../Data/Cubit/cubit/git_country_cubit.dart';
// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<String> imageList = [
    'Images/photo_2023-09-01_12-30-36.jpg',
    'Images/photo_2023-09-02_05-19-05.jpg',
    'Images/photo_2023-09-02_12-47-30.jpg',
    'Images/photo_2023-09-02_12-47-46.jpg',
  ];
  void _showCustomDialog(BuildContext context, String sportName, String getSportName) {
    showDialog(
   
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:  Color.fromARGB(255, 25, 24, 26).withOpacity(0.7), 
          

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Lottie.asset('assets/animation_lm3gj47p.json',
          
                width: 100,
                height: 100,
              ),
            
              const SizedBox(height: 15),
              Text(
                'Coming soon ',
                style: TextStyle(
                  fontSize: 34,
                  fontFamily: GoogleFonts.bebasNeue().fontFamily,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
         
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //backgroundColor: Colors.transparent,

        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.white,
            iconSize: 30,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            splashColor: Colors.blueGrey,
            onPressed: () {},
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/photo_2023-09-02_01-31-07.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.only(top: 176),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 65),
              child: Text(
                  //textAlign: TextAlign.center,

                  "Choose Your fav \n         sport.. ",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: GoogleFonts.aclonica().fontFamily,
                    color: Colors.white,
                  )),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 43, left: 15, right: 15, bottom: 15),
                child: GridView.builder(
                  itemCount: imageList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 17,
                    mainAxisSpacing: 29,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountryScreen(response:context.read<GitCountryCubit>().gitCountry(),
                                
                              ),
                            ),
                          );
                        } else {
                          _showCustomDialog(
                              context, imageList[index], _getSportName(index));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                        //  border: Border.all(color: Colors.white, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(imageList[index]),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _getSportName(index),
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                             // fontFamily: GoogleFonts.aclonica().fontFamily,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSportName(int index) {
    switch (index) {
      case 0:
        return "Football";
      case 1:
        return "Volleyball";
      case 2:
        return "Basketball";
      case 3:
        return "Tennis";
      default:
        return "";
    }
  }
}
