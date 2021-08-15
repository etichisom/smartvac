import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/screens/paynow.dart';

class Payo extends StatefulWidget {
  String amount;

  Payo(this.amount);

  @override
  _PayoState createState() => _PayoState();
}

class _PayoState extends State<Payo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                pop(context),
              ],
            ),
            SizedBox(height: 20,),
            ptitle('Select Payment Option'),
            SizedBox(height: 13,),
            ntitle('Tap any of the options below.'),
            SizedBox(height: 44,),
            card(context,(){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Payn(widget.amount)));
            },'Use bank card'),
            SizedBox(height: 25,),
            card(context,(){},'Use a new Card'),
            SizedBox(height: 25,),
            card(context,(){},'Pay with bank')
          ],
        ),
      )),
    );
  }

 Widget card(BuildContext context,  Function f,String s) {
    return GestureDetector(
      onTap: f,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.grey[300])
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
           mtitle(s),
          ],
        ),
      ),
    );
 }
}
