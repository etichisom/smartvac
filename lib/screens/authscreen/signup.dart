import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvac/component/textfeild.dart';
import 'package:smartvac/modal/usermodel.dart';
import 'package:smartvac/screens/authscreen/signin.dart';
import 'package:smartvac/services/authservice.dart';
import 'package:smartvac/util/dialog.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword= TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       body: SafeArea(
         child: Form(
           key: key,
           child: Padding(
             padding: const EdgeInsets.all(18.0),
             child:ListView(
               children: [
                 SizedBox(height: 30,),
                 Text('Sign up',style: GoogleFonts.poppins(fontSize: 29,fontWeight: FontWeight.w600),),
                 SizedBox(height: 20,),
                 label('Name'),
                 SizedBox(height: 5,),
                 textfield(name),
                 SizedBox(height: 14,),
                 label('email'),
                 SizedBox(height: 5,),
                 textfield(email),
                 SizedBox(height: 14,),
                 label('password'),
                 SizedBox(height: 5,),
                 textfield(password,secure: true),
                 SizedBox(height: 14,),
                 label('confirm password'),
                 SizedBox(height: 5,),
                 textfield(cpassword,secure: true),
                 SizedBox(height: 15,),
                 SizedBox(
                   height: 40,
                   width: size.width,
                   child: ElevatedButton(onPressed: (){
                     signup(context);
                   },
                       child: Text('Sign up',style: GoogleFonts.roboto(color: Colors.white),)),
                 ),
                 SizedBox(height: 10,),
                 log(context)

               ],
   ),
           ),
         ),
       ),
    );
  }
  Widget log(BuildContext context){
    return Row(
      children: [
        Text('Already a user? ',style: GoogleFonts.poppins(fontSize: 16),),
        GestureDetector(
          onTap: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context)=>Signin()));
          },
            child: Text('Login',style: GoogleFonts.poppins(fontSize: 18,color: Colors.blueAccent),))
      ],
    );
  }

   signup(BuildContext context)async {
    if(key.currentState.validate()){
      if(cpassword.text != password.text){
        dia(context, '', 'password do not match').dialog();
      }else{
        Auth(context).Signup(email.text, password.text,name.text);
      }
    }

   }
}
