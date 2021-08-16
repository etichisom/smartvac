import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/screens/chart.dart';
import 'package:smartvac/screens/puchase.dart';
import 'package:smartvac/screens/readings.dart';
import 'package:smartvac/screens/update.dart';
Radius r = Radius.circular(10);
Color c = Color.fromRGBO(255, 255, 255, 1);
Widget dash(BuildContext context){
  return   Column(
    children: [
      Container(
        height: 160,
        child: Row(
          children: [
            box('Hourly \nReadings','','pay now',(){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Chart()));
            },Color.fromRGBO(32, 122, 122, 0.7,)),
            SizedBox(width: 15,),
            box('Out of \nEnergy','Top up your meter','pay now',(){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Purchase()));
            },Color.fromRGBO(229, 150, 31, 1,)),
          ],
        ),
      ),
      SizedBox(height: 15,),
      Container(
        height: 160,
        child: Row(
          children: [
            box('Recent\nUpdates','','pay now',(){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Update()));
            },Color.fromRGBO(53, 75, 133, 0.77)),
            SizedBox(width: 15,),
            box('all readings','','pay now',(){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Reading()));
            },Color.fromRGBO(255, 255, 255, 1)),
          ],
        ),
      ),
    ],
  );
}
   Widget box(String s, String t,String p, Function() f,Color color) {
     return Expanded(
       child: GestureDetector(
         onTap: f,
         child: PhysicalModel(
           color: Colors.black,
           elevation: 2,
           borderRadius: BorderRadius.only(topRight:r,topLeft: r,bottomRight: r),
           child: Container(
           decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight:r,topLeft: r,bottomRight: r),
            color: color
      ),
             child: Padding(
               padding: const EdgeInsets.all(7.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   tt(s,color==c?Colors.black:Colors.white70),
                   Container(
                       child:d(t==''?'Discover a detailed view of your daily energy consumption.':t,
                           color==c?Colors.black:Colors.white70)),
                   SizedBox(),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       d('View now',  color==c?Colors.black:Colors.white70),
                       SizedBox(width: 5,),
                       Icon(Icons.arrow_forward_sharp,size: 10,color: color==c?Colors.black:Colors.white70,)
                     ],
                   )
                 ],
               ),
             ),
    ),

         ),
       ),
  );
}
Widget d(String s,Color colors){
  return Text(s,style: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w400,color:colors),);
}
Widget tt(String s,Color colors){
  return Text(s,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w400,color:colors),);
}