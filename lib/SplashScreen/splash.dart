import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/screens/Home.dart';
import 'package:netflix_clone/screens/Onboard/onboard_screen.dart';
import 'package:netflix_clone/screens/signin.dart';
final auth = FirebaseAuth.instance;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>with TickerProviderStateMixin {
  late final AnimationController _controller;

 @override
 void initState(){
  super.initState();
  _controller=AnimationController(vsync: this);
 }

 @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/lottie/netflix1.json",
                  controller: _controller,
              onLoaded: (compos){
                _controller
                ..duration = compos.duration..forward()
                    .then((value){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context)=>auth.currentUser==null?onboard():Home(),));
                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
