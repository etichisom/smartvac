import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:smartvac/modal/historymodel.dart';
import 'package:smartvac/modal/payhistory.dart';
import 'package:smartvac/services/payment_history.dart';

Widget histile(Data m,Size size){

  return Padding(
    padding: const EdgeInsets.all(9.0),
    child: Container(
      child: Row(

        children: [
          Icon(Icons.download_outlined,color: Colors.grey[600] ,),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(m.units.toString() +' Units',style: GoogleFonts.roboto(fontSize: 17),),
              SizedBox(height: 3,),
              FittedBox(child: Text(day(m.day),style: GoogleFonts.roboto(fontSize: 12,color: Colors.grey),)),
            ],
          ),
          Expanded(child: Container()),
          Row(
            children: [
              CircleAvatar(radius: 4,backgroundColor: Colors.green,),
              SizedBox(width: 5,),
              FittedBox(child: Text('N'+m.amount.toString(),style: GoogleFonts.roboto(fontSize: 15),)),
            ],
          ),
        ],
      ),
    ),
  );
}

String day(String m) {
  DateTime date = DateTime.parse(m);
  return Jiffy({
    "year": date.year,
    "month": date.month,
    "day": date.day,
    "hour": date.hour
  }).yMMMEd;
}