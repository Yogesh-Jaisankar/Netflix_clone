
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/Home.dart';
import 'package:netflix_clone/screens/Onboard/onboard_screen.dart';
import 'package:netflix_clone/screens/profiles.dart';
import 'package:netflix_clone/screens/signin.dart';

class authservice{
  final auth = FirebaseAuth.instance;
  static late TextEditingController email = TextEditingController();
  static late TextEditingController password = TextEditingController();
  final firestore = FirebaseFirestore.instance;

  void loginUser (context)async{
    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.signInWithEmailAndPassword(email: email.text, password: password.text)
          .then((value)=> {
        print("user is lgged in"),
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Profiles()),
                (route) => false)
      });
    }catch(e){
      Navigator.pop(context);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Error Message"),
          content: Text(e.toString()),
        );
      });
    }
  }

  void RegisterUser (context)async{
    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
      await auth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value)=>{
        print("User is registered"),
        firestore.collection("user").add({
          "email" : "Email: "+ email.text,
          "password": "Password: " + password.text,
          "uid":auth.currentUser!.uid,
        }),
        Navigator.push(context, MaterialPageRoute(builder: (c)=>SignIn())),

      });
    }catch(e){
      Navigator.pop(context);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Error Message"),
          content: Text(e.toString()),
        );
      });
    }
  }


  void logOutUser(context)async{
    await auth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (C)=>onboard()), (route) => false);
  }
}