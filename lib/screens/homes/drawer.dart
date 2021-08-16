import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/screens/authscreen/signup.dart';
import 'package:smartvac/screens/homes/history.dart';
import 'package:smartvac/screens/puchase.dart';

import '../splash.dart';
import '../update.dart';

Widget draw(BuildContext context,GlobalKey<ScaffoldState> key){
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        Text('Menu',style: GoogleFonts.poppins(fontSize:24,fontWeight: FontWeight.w700,),),
        SizedBox(height: 30,),
        GestureDetector(
          onTap: (){},
            child: mtitle('Profile')
        ),
        SizedBox(height: 14,),
        GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Purchase()));
            },
            child: mtitle('Renew energy')
        ),
        SizedBox(height: 14,),
        GestureDetector(
         onTap: (){
           Navigator.push(context, CupertinoPageRoute(builder: (context)=>Update()));
         },
         child: mtitle('Recent updates')
        ),
         SizedBox(height: 14,),
         GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>History()));
            },
            child: mtitle('History')
        ),
          SizedBox(height: 14,),
         GestureDetector(
           onTap: (){
             prefs.clear();
             Navigator.pushAndRemoveUntil(context,
                 CupertinoPageRoute(builder: (context)=>Signup()), (route) => false);

           },
           child: mtitle('Log out')
          ),
          SizedBox(height: 14,),
      ],
    ),
  );
}