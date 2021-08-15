import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Noti extends StatefulWidget {
  String title;

  Noti(this.title);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Noti> {
  bool on = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title,style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w400,),),
          Transform.scale(
            scale: 0.5,
            child: CupertinoSwitch(
                value:on,
                activeColor: Colors.lightGreen,
                onChanged:(v){
                  setState(() {
                    on=v;
                  });
                }
            ),
          )
        ],
      ),
    );
  }
}
 Widget notification(){
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 38,
                height: 4,
                color: Colors.grey,
              )
            ],
          ),
        ),
        SizedBox(height: 20,),
        Text('Want to conserve your energy?',style: GoogleFonts.poppins(fontSize:21,fontWeight: FontWeight.w400,),),
        SizedBox(height: 20,),
        Noti(' Reminder to turn off all lights during the day'),
        SizedBox(height: 4,),
        Noti('Reminder to turn off all lights during the day'),
        SizedBox(height: 4,),
        Noti('Reminder to turn off all lights during the day'),
        SizedBox(height: 4,),
        Noti('Reminder to turn off all lights during the day'),
        SizedBox(height: 4,),
        Noti('Reminder to turn off all lights during the day'),
        SizedBox(height: 4,),
      ],
    ),
  );
 }
