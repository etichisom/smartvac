import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smartvac/global.dart';
import 'package:smartvac/screens/authscreen/signup.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  // Color.fromRGBO(8,68,68,1, )
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Color.fromRGBO(8,68,68,1, ),
      body:OverBoard(
        pages: intro,
        showBullets: true,
        skipCallback: () {
          key.currentState.showSnackBar(SnackBar(
            content: Text("Skip clicked"),
          ));
        },
        finishCallback: () {
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
              builder: (context)=>Signup()
          ));
        },
      ),
    );
  }
}
