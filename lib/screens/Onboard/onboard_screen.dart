import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix_clone/screens/Onboard/intro1.dart';
import 'package:netflix_clone/screens/Onboard/intro2.dart';
import 'package:netflix_clone/screens/Onboard/intro3.dart';
import 'package:netflix_clone/screens/Onboard/intro4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class onboard extends StatefulWidget {
  const onboard({super.key});

  @override
  State<onboard> createState() => _HomeState();
}

class _HomeState extends State<onboard> {
  Future <void> _launch()async{
    if (!await launchUrl("https://help.netflix.com/legal/privacy" as Uri)) {
      throw Exception('Could not launch');
    }
  }

  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
  return Scaffold(
    appBar: AppBar(
      //elevation: 50,
      backgroundColor: Colors.black,
      title: Container(
        child: Row(
          children: [
            Image.asset("assets/images/netflixlogo.png",fit: BoxFit.cover,width: 40,height: 40,)
          ],
        ),
      ),
          actions:  [
            Padding(
              padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: (){
                   launch("https://help.netflix.com/legal/privacy");
                  },
                    child: const Text("PRIVACY",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))),
            const SizedBox(width: 20),
             Padding(
                padding:  EdgeInsets.all(5),
                child: InkWell(
                  onTap: (){
                    print("SIGN IN");
                  },
                  child:const Text("SIGN IN",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                )),
            const SizedBox(width: 20),
            Padding(
                padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: (){
                    print("More");
                  },
                    child: Icon(Icons.more_vert))),
            SizedBox(width: 20),
      ],
    ),
    body: Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child:
          PageView(
            controller: _controller,
            children: [
             intro1(),
              intro2(),
              intro3(),
              intro4(),
            ],
          ),),
          SizedBox(height: 30),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: SlideEffect(
                spacing: 15,
                dotWidth:  10,
                dotHeight: 10,
                dotColor: Colors.grey,
                activeDotColor:  Colors.white
            ),),
          SizedBox(height: 20),
           Container(
              decoration: BoxDecoration(
                  color: HexColor("E50914"),
                  borderRadius: BorderRadius.circular(5)
              ),
              margin: EdgeInsets.only(left: 15,right: 15),
              height: 40,
              width: double.infinity,
              //color: HexColor("6BDE84"),
              child: InkWell(
                onTap: (){
                  print("LOGIN");
                },
                child: const Center(
                  child: Text("GET STARTED",
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
          SizedBox(height: 20),
        ],
      ),
    ),
  );

  }
}
