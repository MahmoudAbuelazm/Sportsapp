import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_app/Global/global_data.dart';
import 'package:sports_app/Screen/home_screen.dart';
import 'dart:math';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String phoneNumber = "";
  String otp = "";
  String generatedOtp = "";
  String errorMessage = "";
  final RegExp numericRegExp = RegExp(r'^[0-9]+$');


  void generateOTP() {
    // Generate a random 4-digit OTP
    final random = Random();
    generatedOtp = (1000 + random.nextInt(9000)).toString();
    // Show OTP in an AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Generated OTP"),
          content: Text(generatedOtp),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void verifyOTP() {
    if (_formKey.currentState!.validate()) {
      if (otp == generatedOtp) {
        // Navigate to the home screen with login data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(phoneNumber: phoneNumber),
          ),
        );
      } else {
        // Show an error message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Incorrect OTP. Please try again."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Images/photo_2023-09-02_01-31-07.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Lottie.asset(
                    "assets/animation_lm41di2i.json",
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: phoneNumberController,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  onChanged: (value) {
                                    phoneNumber = value;
                                  },
                                  validator: (value) {
                                        if (!numericRegExp.hasMatch(value!)) {
                                          return "Phone number should contain only numbers";
                                          }
                                    else if (value == null || value.isEmpty) {
                                      return "Phone number is required";
                                    }else if (value.length != 11)
                                      return "Phone number is not valid";
                                     
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Number",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  onChanged: (value) {
                                    otp = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "OTP",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "OTP is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  child: Image.asset(
                                    'Images/google-icon-1024x1024-hv1t7wtt.png',
                                    width: 23,
                                    height: 23,
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: generateOTP,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              GestureDetector(
                                onTap: verifyOTP,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

