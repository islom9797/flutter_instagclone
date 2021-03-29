import 'package:flutter/material.dart';
import 'package:flutter_instagclone/pages/home_page.dart';
import 'package:flutter_instagclone/pages/signup_page.dart';
class SignInPage extends StatefulWidget {
  static final String id="signin_page";
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  _callSignIn(){
    Navigator.pushReplacementNamed(context, SignUpPage.id);
  }
  _callHomepage(){
    Navigator.pushReplacementNamed(context, Homepage.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(193, 53, 132, 1),//bu yerda birni manosi hiralashtirishni kodi 1 degani asl rang
                Color.fromRGBO(131, 58, 180,1),//bu yerda birni manosi
              ]
          ),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Instagram",style: TextStyle(color: Colors.white,fontFamily: "Billabong",fontSize: 45),),
                    SizedBox(height: 20,),
                    //email
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 17,color: Colors.white)
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    //password
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",

                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 17,color: Colors.white)
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    //button
                    GestureDetector(
                      onTap: (){
                        _callHomepage();
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: Center(
                          child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 17),),
                        ),
                      ),
                    ),
                  ],

            )
            ),
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an acoount",style: TextStyle(color: Colors.white,fontSize: 16),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: _callSignIn,
                    child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}
