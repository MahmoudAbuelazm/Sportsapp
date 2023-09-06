import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_app/Screen/players.dart';
 //import 'package:sports_app/Screens/players.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
      late AnimationController _fadeTextController;
  @override
  void initState() {
    super.initState();
    _fadeTextController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    ); 
    _fadeTextController.forward();
    
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Players())));
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
  body:  Container(


      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Images/Background.png"), fit: BoxFit.cover)),
      child: Stack(
        children: [
      
          FadeTransition(
            opacity: _fadeTextController,
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 700),
                  child: Center(
                    child: Text("Sports",
                                                              style: TextStyle(
                                                                  color:
                                                                      Colors.white,
                                                                  fontFamily: "Allerta",
                                                                  fontSize: 30),),
                  ),
                )
                ),
          ),
       
       
       
        ],
      ))
    );
  }
}


