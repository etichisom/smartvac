import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvac/component/textfeild.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/modal/usermodel.dart';
import 'package:smartvac/screens/homes/bottomnav.dart';
import 'package:smartvac/services/authservice.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final fkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     body: SafeArea(
       child: Form(
         key: fkey,
           child:
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                SizedBox(height: 10,),
               Row(children: [pop(context),],),
                SizedBox(height: 20,),
                Text('Log in',style: GoogleFonts.poppins(fontSize: 29,fontWeight: FontWeight.w600),),
                SizedBox(height: 20,),
                label('email'),
                SizedBox(height: 5,),
                textfield(email),
                SizedBox(height: 20,),
                label('password'),
                SizedBox(height: 5,),
                textfield(password,secure: true),
                SizedBox(height: 50,),
                SizedBox(
                  height: 40,
                  width: size.width,
                  child: ElevatedButton(onPressed: (){
                  signin(context);
                  },
                      child: Text('Sign in',style: GoogleFonts.roboto(color: Colors.white),)),
                ),
             ],
            ),
          ),
       ),
     ),
    );
  }

   signin(BuildContext context)async {
    if(fkey.currentState.validate()){
     usermodel u = await Auth(context).login(email.text, password.text,);
    }

   }


}
