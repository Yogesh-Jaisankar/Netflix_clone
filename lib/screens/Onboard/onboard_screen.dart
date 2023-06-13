import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:netflix_clone/screens/Onboard/intro1.dart';
import 'package:netflix_clone/screens/Onboard/intro2.dart';
import 'package:netflix_clone/screens/Onboard/intro3.dart';
import 'package:netflix_clone/screens/Onboard/intro4.dart';
import 'package:netflix_clone/screens/signin.dart';
import 'package:netflix_clone/screens/signup.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class onboard extends StatefulWidget {
  const onboard({super.key});

  @override
  State<onboard> createState() => _HomeState();
}

class _HomeState extends State<onboard> {
  final Uri _url = Uri.parse('https://help.netflix.com/legal/privacy');
  final Uri _urlfaq = Uri.parse('https://openconnect.netflix.com/en/faq/');
  final Uri _urlhelp = Uri.parse('https://help.netflix.com/en/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _launchUrlfaq() async {
    if (!await launchUrl(_urlfaq)) {
      throw Exception('Could not launch $_urlfaq');
    }
  }

  Future<void> _launchUrlhelp() async {
    if (!await launchUrl(_urlhelp)) {
      throw Exception('Could not launch $_urlhelp');
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
                   _launchUrl();
                  },
                    child: const Text("PRIVACY",
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
            PopupMenuButton<String>(
                itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text("FAQ's"),onTap: (){
                  _launchUrlfaq();
                },),
                PopupMenuItem(child: Text("Help"),onTap: (){
                  _launchUrlhelp();
                },)
,
              ];
            }),
            const SizedBox(width: 20),
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
            children: const [
              intro1(),
              intro2(),
              intro3(),
              intro4(),
            ],
          ),),
          const SizedBox(height: 30),
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect:const SlideEffect(
                spacing: 15,
                dotWidth:  10,
                dotHeight: 10,
                dotColor: Colors.grey,
                activeDotColor:  Colors.white
            ),),
           const SizedBox(height: 20),
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
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
          const SizedBox(height: 20),
        ],
      ),
    ),
  );

  }
}
