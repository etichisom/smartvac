import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textfield(TextEditingController controller,{bool secure}){
  return TextFormField(
    controller: controller,
    obscureText: secure==null?false:secure,
    validator:  (v){
      if(v.length < 3){
        return 'Field empty';
      }
    },
    decoration: InputDecoration(
      border: OutlineInputBorder()
    ),
  );
}
Widget textfieldh(TextEditingController controller,String s,bool enable){
  return TextFormField(
    enabled:enable,
    controller: controller,
    validator:  (v){
      if(v.length < 1){
        return 'Field empty';
      }
    },
    keyboardType:TextInputType.number,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
      hintText:s
    ),
  );
}
Widget cardfieldh(TextEditingController controller,String s){
  return TextFormField(
    controller: controller,
    keyboardType:TextInputType.number,
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText:s,
      fillColor: Colors.grey[200],
      filled: true
    ),
  );
}
Widget label(String label){
  return Text(label,style: GoogleFonts.poppins(fontSize: 16),);
}