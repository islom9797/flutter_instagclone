import 'package:flutter/material.dart';
import 'package:flutter_instagclone/pages/home_page.dart';
import 'package:flutter_instagclone/pages/signin_page.dart';
import 'package:flutter_instagclone/pages/signup_page.dart';
import 'package:flutter_instagclone/pages/splash_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity

      ),
      home:SplashPage(),
      routes: {
        SplashPage.id:(context)=>SplashPage(),
        SignUpPage.id:(context)=>SignUpPage(),
        SignInPage.id:(context)=>SignInPage(),
        Homepage.id:(context)=>Homepage(),
      },
    );
  }
}
