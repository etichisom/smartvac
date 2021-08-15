import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvac/component/textfeild.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/services/pay.dart';

class Payn extends StatefulWidget {
  String amount;

  Payn(this.amount);

  @override
  _PaynState createState() => _PaynState();
}

class _PaynState extends State<Payn> {
  TextEditingController cardn = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController exp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child:ListView(
          children: [
            Row(
              children: [
                pop(context),
              ],
            ),
            SizedBox(height: 20,),
            ptitle('Pay Now'),
            SizedBox(height: 13,),
            ntitle('Pay for energy using your bank card'),
            SizedBox(height: 30,),
            label('Card numberEnter amount'),
            SizedBox(height: 10,),
            cardfieldh(cardn, '****  ****  ****  ****  ****'),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label('Expiry'),
                        SizedBox(height: 10,),
                        cardfieldh(exp, 'MM/YY'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label('CVV'),
                        SizedBox(height: 10,),
                        cardfieldh(cvv, '***'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label('PIN'),
                        SizedBox(height: 10,),
                        cardfieldh(pin, '****'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
        SizedBox(
          height: 38,
          child: RaisedButton(onPressed: (){
            pay(context);
            //Navigator.push(context, CupertinoPageRoute(builder: (context)=>Payo()));
          },
            color:  Color.fromRGBO(8, 68, 68, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('Pay',style: GoogleFonts.roboto(
                color:Colors.white
            ),),))
          ],
        ),
      )),
    );
  }

   pay(BuildContext context) {
     int price = int.parse(widget.amount);
     double unit = price/20;
     int u = unit.toInt() * 1;
     Payservice(context).pay(price,u);
   }
}
