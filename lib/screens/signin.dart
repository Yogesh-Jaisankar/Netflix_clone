import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/Onboard/onboard_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context)=>onboard()));
            },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Container(
          child: Row(
            children: [
              Image.asset("assets/images/netflixlogo1.png",fit: BoxFit.cover,height: 70,width: 120,)
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
             height: 200,
              width: 400,
              child: ListView(
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(focusedBorder: InputBorder.none,
                      focusColor: Colors.white,
                        filled: true,
                        fillColor: Colors.white10,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white10,
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}
