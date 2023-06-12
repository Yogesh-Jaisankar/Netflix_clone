import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class intro4 extends StatelessWidget {
  const intro4({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/images/main.png"),
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
        Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment(0,0.80),
                child: Text("Watch\n everywhere\n",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont("Poppins",
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text("Stream on your phone,\ntablet, laptop, TV and more.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont("Poppins",
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
