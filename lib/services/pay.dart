import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jiffy/jiffy.dart';
import 'package:smartvac/screens/homes/bottomnav.dart';
import 'package:smartvac/util/dialog.dart';
import 'package:smartvac/util/loader.dart';

import 'authservice.dart';

class Payservice{
  BuildContext context;

  Payservice(this.context);

  pay(int amount,int unit)async{
   loader(context).showloader();
   print(amount);
   print(unit.toInt());
    var url = Uri.parse('https://smartvac-api.herokuapp.com/pay');
    try {
      Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "amount": amount.toInt(),
          "units": unit,
          "user_id": 1
        }),);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(context,
            CupertinoPageRoute(builder: (context) => Bnav()), (route) => false);
      }else{
      print(response.body);
      loader(context).pop();
      dia(context,'',response.body).dialog();
      }
    }catch(e){
      loader(context).pop();
      dia(context,'','check internet connection').dialog();

    }
  }
}