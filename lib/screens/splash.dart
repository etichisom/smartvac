import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:smartvac/screens/homes/bottomnav.dart';
import 'package:smartvac/screens/onboarding/introduction.dart';
import 'package:workmanager/workmanager.dart';

import '../main.dart';
SharedPreferences prefs;
int id;
class Splash extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Splash> {
  BuildContext contex;
  @override
  Widget build(BuildContext context) {
    contex=context;
    return Scaffold(
      //
      backgroundColor:Color.fromRGBO(32,122,122, 1) ,
      body: Center(
        child:ShowUpAnimation(
          child: Text('Smarvac',style: GoogleFonts.acme(fontSize: 40,color: Colors.white),),
        ) ,
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      nav();
    });
  }
  nav() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getInt('id');
    if(id==null){
      Navigator.pushReplacement(contex,CupertinoPageRoute(
          builder: (context)=>Intro()
      ));
    }else{
      Navigator.pushReplacement(contex,CupertinoPageRoute(
          builder: (context)=>Bnav()
      ));
    }
    if(prefs.getBool('n')== null){
      prefs.setBool('n', true);
      if(Platform.isAndroid) {
        Workmanager().registerPeriodicTask('1', simplePeriodicTask,
          existingWorkPolicy: ExistingWorkPolicy.replace,
          frequency: Duration(hours: 1),);
      }
    }
  }
}
