import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:smartvac/modal/usermodel.dart';
import 'package:smartvac/screens/authscreen/signin.dart';
import 'package:smartvac/screens/authscreen/signup.dart';
import 'package:smartvac/screens/homes/bottomnav.dart';
import 'package:smartvac/screens/splash.dart';
import 'package:smartvac/util/dialog.dart';
import 'package:smartvac/util/loader.dart';
usermodel cuser;
class Auth{
BuildContext context;

Auth(this.context);






Signup(String email ,String password ,String name ,)async{
   var url = Uri.parse('https://smartvac-api.herokuapp.com/signup');
   var json ;
   loader(context).showloader();
try{
 Response response = await http.post(url,
   headers: <String, String>{
     'Content-Type': 'application/json; charset=UTF-8',
   },
   body: jsonEncode(<String, String>{
     "email":email.trim(),
     "name":name.trim(),
     "password":password.trim()
   }),);
   loader(context).pop();
  if(response.statusCode ==201){
    json = jsonDecode(response.body);
    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Signin()));
    dia(context, 'Login',json['message'].toString(),).dialog();
  }else{
    json = jsonDecode(response.body);
    dia(context, json['error'].toString(),'could not sign up').dialog();
  }
}catch(e){
  loader(context).pop();
  dia(context,'','check internet connection').dialog();
}


}
Future<usermodel> login(String email ,String password,)async{
  usermodel u;
  loader(context).showloader();
  var url = Uri.parse('https://smartvac-api.herokuapp.com/signin');
  try {
    Response response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email.trim(),
        "password": password.trim()
      }),);
    var json = jsonDecode(response.body);
    loader(context).pop();
    if (response.statusCode == 200) {
      cuser = usermodel.fromJson(json);
      prefs.setInt('id', cuser.data.iD);
      id= cuser.data.iD;
      Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (context) => Bnav()), (route) => false);

      return usermodel.fromJson(json);
    } else {
      dia(context, json['error'].toString(), 'could not sign in').dialog();
      return null;
    }
  }catch(e){
    print(e);
    //loader(context).pop();
    dia(context,'','check internet connection').dialog();
  }

}
}