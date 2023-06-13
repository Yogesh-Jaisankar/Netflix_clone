import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix_clone/screens/signin.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {

    final Uri _urlhelp = Uri.parse('https://help.netflix.com/en/');

    Future<void> _launchUrlhelp() async {
      if (!await launchUrl(_urlhelp)) {
        throw Exception('Could not launch $_urlhelp');
      }
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          child: Row(
            children: [
              Image.asset("assets/images/netflixlogo1.png",fit: BoxFit.cover,height: 70,width: 120,)
            ],
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.all(5),
              child: InkWell(
                  onTap: (){
                    _launchUrlhelp();
                  },
                  child: const Text("HELP",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))),
          const SizedBox(width: 20),
          Padding(
              padding:  EdgeInsets.all(5),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                },
                child:const Text("SIGN IN",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              )),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              width: 400,
              child: ListView(
                children: [
                  SizedBox(height: 60),
                  Text("Ready to experience\nunlimited TV shows &\nmovies?",
                    style: GoogleFonts.getFont("Poppins",
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                   Text("Create an account to learn more\nabout Netflix.",
                     style: GoogleFonts.getFont("Poppins",
                         fontSize: 20,
                         color: Colors.white,
                         fontWeight: FontWeight.w300),
                    ),
                  const SizedBox(height: 30),
                  TextField(
                    cursorColor: HexColor("E50914"),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(focusedBorder: InputBorder.none,
                        focusColor: Colors.white,
                        filled: true,
                        fillColor: Colors.white10,
                        labelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    cursorColor: HexColor("E50914"),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white10,
                        labelText: "Password",
                        labelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                  ),
                  const  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: HexColor("E50914"),
                        ),
                        color: HexColor("E50914"),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    //margin: EdgeInsets.only(left: 15,right: 15),
                    height: 60,
                    width: double.infinity,
                    //color: HexColor("6BDE84"),
                    child: InkWell(
                      onTap: (){
                        print("LOGIN");
                      },
                      child: const Center(
                        child: Text("CONTINUE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text("Sign Up is protected by Google reCAPTCHA to ensure\nyou're not a bot. Learn more.",textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),),
                ],
              ),
            )
          ],
        ),
      )

    );
}}
