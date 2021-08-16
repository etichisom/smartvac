import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget title(String s){
  return  Text(s,style: GoogleFonts.roboto(fontSize: 29,fontWeight: FontWeight.w500),);
}
Widget stitle(String s){
  return  Text(s,style: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w400),);
}
Widget rtitle(String s){
  return  Text(s,style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.red),);
}
Widget wtitle(String s){
  return  Text(s,style: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.white),);
}
Widget ntitle(String s){
  return  Text(s,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w400,),);
}
Widget wntitle(String s){
  return  Text(s,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white),);
}
Widget mtitle(String s){
  return  Text(s,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,),);
}
Widget ptitle(String s){
  return  Text(s,style: GoogleFonts.poppins(fontSize: 23,fontWeight: FontWeight.w500,),);
}
Widget pptitle(String s){
  return  Text(s,style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w400,),);
}
Widget pop(BuildContext context){
  return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,));
}