import 'dart:convert';
import 'package:http/http.dart';
import 'package:smartvac/modal/payhistory.dart';
import 'package:http/http.dart' as http;
import 'package:smartvac/services/authservice.dart';
payh p ;
class payhis{
  Future<payh> gethistory()async {
    var url = Uri.parse('https://smartvac-api.herokuapp.com/history/1');
    Response response = await http.get(url);
    if(response.statusCode ==200){
      print(response.body);
      return payh.fromJson(jsonDecode(response.body));
    }else{
      print(response.body);
    }


  }
}