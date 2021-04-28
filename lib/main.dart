import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagclone/pages/home_page.dart';
import 'package:flutter_instagclone/pages/signin_page.dart';
import 'package:flutter_instagclone/pages/signup_page.dart';
import 'package:flutter_instagclone/pages/splash_page.dart';
import 'package:flutter_instagclone/services/pref_service.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget _callstartPage() {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          Prefs.saveUserId(snapshot.data.uid);
          return SplashPage();
        } else {
          Prefs.removeUserId();
          return SignInPage();
        }
      },
    );
  }
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
      home:_callstartPage(),
      routes: {
        SplashPage.id:(context)=>SplashPage(),
        SignUpPage.id:(context)=>SignUpPage(),
        SignInPage.id:(context)=>SignInPage(),
        Homepage.id:(context)=>Homepage(),
      },
    );
  }
}
