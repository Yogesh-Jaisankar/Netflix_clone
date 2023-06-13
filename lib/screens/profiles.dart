import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:netflix_clone/screens/Home.dart';
class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: Row(
            children: [
              Spacer(),
              Image.asset("assets/images/netflixlogo1.png",fit: BoxFit.cover,height: 70,width: 120,),
             SizedBox(width: 100),
              Icon(Icons.create,color: Colors.white,)
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children:  [
            Text("Who's Watching?",textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,
                  fontWeight: FontWeight.w800,
                  fontSize: 20
              ),),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        showToast("Welcome Back! GodLxBabyGirl",context:context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/space-man.png"),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("GodlxBabyGirl",style: TextStyle(color: Colors.white),),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        showToast("Showing Children Contents!",context:context);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/boy.png",fit: BoxFit.contain,),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Children",style: TextStyle(color: Colors.white),),
                  ],
                )
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        showToast("Feature will be available soon!",context:context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/edit.png",fit: BoxFit.contain,),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Edit Profile",style: TextStyle(color: Colors.white),),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
