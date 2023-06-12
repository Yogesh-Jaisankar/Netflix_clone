import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/helper/data.dart';
import 'package:netflix_clone/screens/Home.dart';
class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  int length = ListofItems.loadlist().length;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return PageView.builder(
        itemCount: length,
        itemBuilder: (context, int index) {
          Item i = ListofItems.loadlist()[index];
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: index == 0 ? i.clr.withOpacity(0) : i.clr,
                ),
                Image(
                  fit: BoxFit.cover,
                  height: h,
                  width: w,
                  image: index == 0
                      ? AssetImage('assets/movieslist.png')
                      : AssetImage('assets/blank.png'),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.8),
                        Colors.transparent,
                        Colors.black,
                      ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                ),
                Positioned(
                  left: w / 6,
                  top: h / 6,
                  child: Image(
                    fit: BoxFit.fill,
                    height: h / 3,
                    width: w / 1.5,
                    image: AssetImage(i.img),
                  ),
                ),
                Positioned(
                    top: h / 1.65,
                    child: Container(
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            i.head,
                            style: GoogleFonts.rubik(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    top: h / 1.5,
                    child: Container(
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            i.description,
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
                // SafeArea(
                //   child: Row(
                //     children: <Widget>[
                //       Image(
                //         width: w / 3,
                //         image: AssetImage('assets/netflixlogo.png'),
                //       ),
                //       SizedBox(
                //         width: w / 2.8,
                //       ),
                //       Text(
                //         'Help  ',
                //         style: GoogleFonts.rubik(
                //             fontSize: 15,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w700),
                //       ),
                //       Text(
                //         ' Privacy',
                //         style: GoogleFonts.rubik(
                //             fontSize: 15,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w700),
                //       )
                //     ],
                //   ),
                // ),
                Positioned(
                  top: h/1.18,
                  left: w/2.5,
                  child: Container(
                    width: w,
                    height: h * (0.027),
                    child: ListView.builder(
                        itemCount: length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int i) => Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: 10,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:index == i ?  Colors.red: Colors.white),
                          ),
                        )),
                  ),
                ),
                Positioned(
                  top: h/1.1,
                  left: w/30,
                  child: Container(
                    width: w/1.08,
                    height: h*0.07,
                    color: Colors.red,
                    //child: FlatButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));},
                      child: Center(
                      child: Text('SIGN IN',style: GoogleFonts.rubik(
                        fontSize: 24,
                        color: Colors.white,
                      ),),
                    ),),
                  ),

              ],
            ),
          );
        });
  }
}
