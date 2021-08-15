import 'dart:convert';
import 'package:http/http.dart';
import 'package:smartvac/modal/payhistory.dart';
import 'package:http/http.dart' as http;
import 'package:smartvac/modal/user.dart';
import 'package:smartvac/screens/splash.dart';
import 'package:smartvac/services/authservice.dart';
payh p ;
user ud;
class userd{
  Future<user> getuser()async {
    var url = Uri.parse('https://smartvac-api.herokuapp.com/user/${id}');
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        return user.fromJson(jsonDecode(response.body));
      } else {
        print(response.body);
      }
    }catch(e){
      getuser();
    }

  }
}