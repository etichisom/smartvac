import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvac/component/textfeild.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/screens/payoption.dart';
import 'package:smartvac/services/authservice.dart';

class Purchase extends StatefulWidget {
  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  TextEditingController amount = TextEditingController();
  TextEditingController availble = TextEditingController();
  final fkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: fkey,
          child: ListView(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),
                ],
              ),
              SizedBox(height: 20,),
              ptitle('Want to get Energy?'),
              SizedBox(height: 13,),
              ntitle('Enter an amount and see available units.'),
              SizedBox(height: 34,),
              rtitle(' 1 unit is billed at N20 *'),
              SizedBox(height: 5,),
              label('Enter amount'),
              SizedBox(height: 10,),
              textfieldh(amount, 'N1000',true),
              SizedBox(height: 30,),
              label('Available unit'),
              SizedBox(height: 10,),
              textfieldh(availble, '100',false),
              //mtitle(amount.l),
              SizedBox(height: 41,),
              SizedBox(
                height: 38,
                child: RaisedButton(onPressed: (){
                  next(context);
                },
                    color:  Color.fromRGBO(8, 68, 68, 1)
                ,child: Text('Proceed',style: GoogleFonts.roboto(
                  color:Colors.white
                ),),),
              )
            ],
          ),
        ),
      )),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    availble.text = '0';
    amount.addListener(() {
      print(amount.text);
      if(amount.text.length > 0){
     int i = int.parse(amount.text);
     var d = i/20;
     var t = d.toString();
      availble.text =  t;
      }
    });

  }

   next(BuildContext context) {
    if(fkey.currentState.validate()){
      Navigator.push(context, CupertinoPageRoute(builder: (context)=>Payo(amount.text)));
    }
   }
}
