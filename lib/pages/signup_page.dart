import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagclone/pages/home_page.dart';
import 'package:flutter_instagclone/pages/signin_page.dart';
import 'package:flutter_instagclone/services/auth_service.dart';
import 'package:flutter_instagclone/services/pref_service.dart';
import 'package:flutter_instagclone/services/util_service.dart';
class SignUpPage extends StatefulWidget {
  static final String id="signup_page";
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var fullnamecontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var cpasswordcontroller=TextEditingController();
  var isLoading=false;


  _doSignUp(){
    String name = fullnamecontroller.text.toString().trim();
    String email = emailcontroller.text.toString().trim();
    String password = passwordcontroller.text.toString().trim();
    String cpassword = cpasswordcontroller.text.toString().trim();
    if(name.isEmpty || email.isEmpty || password.isEmpty) return;
    if (email.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      Utils.fireToast('Enter a valid email!') ;
      return ;
    }
    if (password.isEmpty || ! RegExp(  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password)) {
      Utils.fireToast('Enter a valid password!') ;
      return ;
    }else{
      print(true );
    }
    if(password!=cpassword){
      Utils.fireToast("Password and confirm Password does not match");
      return;
    }


    setState(() {
      isLoading = true;
    });
    AuthService.signUpUser(context, name, email, password).then((firebaseUser) => {
      _getFirebaseUser(firebaseUser),
    });
  }

  _getFirebaseUser(User firebaseUser) async {
    setState(() {
      isLoading = false;
    });
    if (firebaseUser != null) {
      await Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushReplacementNamed(context, Homepage.id);
    } else {
      Utils.fireToast("Check your informations");
    }
  }
  _callSignIn(){
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }
  _callHomepage(){
    Navigator.pushReplacementNamed(context, Homepage.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Color.fromRGBO(193, 53, 132, 1),//bu yerda birni manosi hiralashtirishni kodi 1 degani asl rang
                  // Color.fromRGBO(131, 58, 180,1),//bu yerda birni manosi
                  Color.fromRGBO(252, 175, 69, 1),
                  Color.fromRGBO(245, 96, 64, 1)
                ]
            ),

          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Instagram",style: TextStyle(color: Colors.white,fontFamily: "Billabong",fontSize: 45),),
                          SizedBox(height: 20,),
                          //fullname
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: fullnamecontroller,
                              decoration: InputDecoration(
                                  hintText: "Fullname",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 17,color: Colors.white)
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
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
                          //Confirm Password
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: cpasswordcontroller,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Confirm Password",

                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 17,color: Colors.white)
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          //button
                          GestureDetector(
                            onTap: (){
                              _doSignUp();
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
                                child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 17),),
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
                        Text("Already have an acoount",style: TextStyle(color: Colors.white,fontSize: 16),),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: _callSignIn,
                          child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,)
                ],
              ),
              isLoading?Center(
                child: CircularProgressIndicator(),
              ):SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
