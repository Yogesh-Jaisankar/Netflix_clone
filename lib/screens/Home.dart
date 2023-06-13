import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix_clone/helper/helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  authservice authService = authservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: GestureDetector(
        onTap: (){
          showToast("You have been signed out",context:context);
          authservice AuthService = authservice();
          authService.logOutUser(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: HexColor("6BDE84"),
              borderRadius: BorderRadius.circular(13)
          ),
          margin: EdgeInsets.all(40),
          height: 40,
          width: double.infinity,
          //color: HexColor("6BDE84"),
          child: const Center(
            child: Text("Sign Out",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
