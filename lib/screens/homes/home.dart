import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smartvac/component/dashboard.dart';
import 'package:smartvac/component/header.dart';
import 'package:smartvac/component/indicatorchart.dart';
import 'package:smartvac/component/notification.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/component/usauge.dart';
import 'package:smartvac/modal/user.dart';
import 'package:smartvac/services/authservice.dart';
import 'package:smartvac/services/getuser.dart';
import 'package:smartvac/services/pay.dart';
import 'package:smartvac/services/socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final key = GlobalKey<ScaffoldState>();
  final _channelS = WebSocketChannel.connect(
    Uri.parse('ws://smartvac-api.herokuapp.com/ws'),
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      drawer: Drawer(
        child: draw(context,key),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child:ud==null?Center(child: CircularProgressIndicator()):Column(
          children: [
            head(context,size,key),
            Expanded(
              child: Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 20,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        stitle('Usage summary'),
                        Expanded(child: Container()),
                        Chip(label:wtitle('7 days'),backgroundColor: Color.fromRGBO(87, 128, 128, 1),),
                        SizedBox(width: 15,),
                        stitle('30 days Custom' )
                      ],
                    ),
                    SizedBox(height: 20,),
                    chart(_channelS.stream),
                    SizedBox(height: 20,),
                    ntitle('Quick Options'),
                    SizedBox(height: 15,),
                    dash(context),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

@override
  void dispose() {

    super.dispose();
  }
@override
@override
void initState() {
  // TODO: implement initState
  super.initState();
  getuser();
}

  getuser() {
    userd().getuser().then((value){
      setState(() {
        ud=value;
        print(ud);
      });
    });
  }

 String percent(Units u) {
    var k = u.usedUnit/u.totalUnit;
    var p = k * 100;
    print(p);
    return k.toStringAsFixed(2) + '%';
 }


}
