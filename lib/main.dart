import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/sample.dart';
import 'package:netflix_clone/screens/Home.dart';
import 'package:netflix_clone/screens/Onboard/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: AnimatedSplashScreen(
              backgroundColor: Colors.black,
                duration: 1000,
                splash: Lottie.asset('assets/lottie/logo.json',height: 1500,width: 1500),
                nextScreen: onboard()),
          ),
        ],
      ),
    );
  }
}

