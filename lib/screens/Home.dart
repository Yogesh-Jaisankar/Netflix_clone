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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          child: Row(
            children: [
              Image.asset("assets/images/netflixlogo.png",fit: BoxFit.cover,width: 40,height: 40,)
            ],
          ),
        ),
        actions:  [
          const Icon(Icons.search_outlined,color: Colors.white,size: 35,),
          const SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 35,
            width: 35,
            child: Image.asset("assets/images/space-man.png"),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.8),
                    Colors.black,
                    Colors.black,
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
              ),
              height: 600,
              width: 500,
              child:Stack(
                children: [
                  const Image(image: AssetImage("assets/images/st.jpg"),),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black.withOpacity(.12),
                          Colors.black.withOpacity(.12),
                          Colors.transparent,
                          Colors.black,
                        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                    ),
                  ),
                  const Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 250),
                      Text("TV Shows",style: TextStyle(color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),),
                      SizedBox(width: 30),
                      Text("Movies",style: TextStyle(color: Colors.white,fontSize: 15,
                          fontWeight: FontWeight.bold),),
                      SizedBox(width: 30),
                      Text("Categories",style: TextStyle(color: Colors.white,fontSize: 15,
                          fontWeight: FontWeight.bold),)
                    ],
                  ),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sci-fi",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 20),
                        Text("|",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 20),
                        Text("Teen",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 20),
                        Text("|",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 20),
                        Text("Horror",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon((Icons.add),color: Colors.white,),
                              SizedBox(height: 5),
                              Text("My List",style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10
                              ),),
                            ],
                          ),
                          SizedBox(width: 40),
                          Container(
                            decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.circular(2)
                            ),
                            constraints: BoxConstraints(
                              maxWidth: 70
                            ),

                            child: Row(
                              children: [
                                Icon((Icons.play_arrow),color: Colors.black,),
                                SizedBox(width: 5),
                                Text("Play",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          SizedBox(width: 40),
                          Column(
                            children: [
                              Icon((Icons.info),color: Colors.white,),
                              SizedBox(height: 5),
                              Text("Info",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                                  fontSize: 10),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                  ],)
                ],
              ),

            ),
            Container(
              color: Colors.green,
              height: 300,
              width: 500,
            ),
            Container(
              color: Colors.red,
              height: 300,
              width: 500,
            ),
          ],

        ),
      ),
    );
  }
}
