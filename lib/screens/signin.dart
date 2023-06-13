import 'package:flutter/material.dart';
import 'package:netflix_clone/helper/helper.dart';
import 'package:netflix_clone/screens/Onboard/onboard_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {

    authservice authService = authservice();

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
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                 height: MediaQuery.of(context).size.height,
                width: 400,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 150),
                    TextField(
                      controller: authservice.email,
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
                      controller: authservice.password,
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
                          color: Colors.grey
                        ),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      //margin: EdgeInsets.only(left: 15,right: 15),
                      height: 60,
                      width: double.infinity,
                      //color: HexColor("6BDE84"),
                      child: InkWell(
                        onTap: (){
                          if(authservice.email != "" && authservice.password != ""){
                            authService.loginUser(context);
                          }
                        },
                        child: const Center(
                          child: Text("Sign In",
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
                    const Text("Need Help?",textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey,
                      fontSize: 16
                      ),),
                    const SizedBox(height: 30),
                    const Text("New to Netflix? Sign up now.",textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),),
                    const SizedBox(height: 30),
                    const Text("Sign In is protected by Google reCAPTCHA to ensure\nyou're not a bot. Learn more.",textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),),

                  ],
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
