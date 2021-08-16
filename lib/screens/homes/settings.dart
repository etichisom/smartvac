import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/screens/splash.dart';
import 'package:workmanager/workmanager.dart';

import '../../main.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool on = true;
  List<int> i = [0,10,20,30,40,50,60];
  var value = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(height: 40,),
              title('Settings'),
              SizedBox(height: 20,),
              set('Turn off notifications', Transform.scale(
                scale: 0.6,
                child: CupertinoSwitch(
                    value:on,
                    activeColor: Colors.greenAccent,
                    onChanged:(v){
                      setState(() {
                        on=v;
                        prefs.setBool('n', v);
                      });
                      if(v==true){
                        Workmanager().registerPeriodicTask('1', simplePeriodicTask,
                          existingWorkPolicy: ExistingWorkPolicy.replace,
                          frequency: Duration(hours: 1),);
                      }else{
                        Workmanager().cancelAll();
                      }
                    }
                    ),
              )),
              SizedBox(height: 15,),
              set('Change bank card', Icon(Icons.arrow_forward_sharp,size: 15,)),
              SizedBox(height: 15,),
              set('Autopay in unit ',dropdown() )


            ],
        ),
          )),
    );
  }
  Widget set(String s, Widget w){
    return Row(
      children: [
        Text(s,style: GoogleFonts.poppins(fontSize: 18,),),
        SizedBox(width: 15,),
        w
      ],
    );
  }
  Widget dropdown(){
    return DropdownButton<int>(
        items:i.map((int e) =>DropdownMenuItem<int>(
            child: Text(e.toString()),
          value: e,
        )).toList(),
      onTap: (){},
      onChanged: (v){
          setState(() {
            value=v;
          });


      },
      value:value ,
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();

  }

   check()async {
    var b =  prefs.getBool('n');
    on =b;
    setState(() {});
   }
}
