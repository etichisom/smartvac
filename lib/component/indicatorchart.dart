import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smartvac/services/socket.dart';

Widget chart (Stream stream1){
  return   StreamBuilder(
      stream: stream1,
      builder: (context, snapshot) {
        if(snapshot.data == null){
          return CircularPercentIndicator(
            radius: 190.0,
            lineWidth: 28.0,
            animation: true,
            animationDuration: 1200,
            percent:0,
            progressColor:Color.fromRGBO(53,75, 133, 1),
            //p: Color.fromRGBO(53,75, 133, 1),
            center: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            ),
          );
        }
        var s = jsonDecode(snapshot.data);
        print(snapshot.data);
        socket soc = socket.fromJson(s);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 190.0,
              lineWidth: 28.0,
              animation: true,
              animationDuration: 1200,
              percent:0,
              progressColor:Color.fromRGBO(53,75, 133, 1),
              //p: Color.fromRGBO(53,75, 133, 1),
              center: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(soc.units.usedUnit.toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 21),),
                  Text('  out of \n  ${soc.units.totalUnit}',style: GoogleFonts.poppins(fontSize: 12)),
                ],
              ),
            ),
          ],
        );
      }
  );
}
String percent(Units u) {
  var k = u.usedUnit/u.totalUnit ;
  var p = k * 100;
  print(p);
  return k.toStringAsFixed(2) + '%';
}
double per(socket soc) {
  var p = soc.units.usedUnit/soc.units.totalUnit ;
  print(p);
  return p;

}
