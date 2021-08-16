import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvac/services/getuser.dart';

import 'bottomsheet.dart';

Widget head(BuildContext context,Size size, GlobalKey<ScaffoldState> key){
  return  Row(
    children: [
      GestureDetector(
          onTap: (){
            key.currentState.openDrawer();
          },
          child: Icon(Icons.menu_sharp,size: 24,)),
      SizedBox(width: 10,),
      Text('Welcome back, ${ud.data.name.toString()}',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500)),
      Expanded(child: Container()),
      GestureDetector(
          onTap: (){
            bottom(context,size);
          },
          child: Icon(Icons.notifications_outlined)),
    ],
  );
}
