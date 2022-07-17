import 'dart:async';

//import 'package:firebase_login/page1.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/screens/introslider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // ignore: prefer_const_constructors
    Timer(
        // ignore: prefer_const_constructors
        Duration(
          seconds:3,
        ),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => IntroSlider())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFE2550),
      body: Center(
          child: Image(
        image: AssetImage(
          "assets/pic5.png",
        ),
        color: Colors.white,
      )),
    );
  }
}