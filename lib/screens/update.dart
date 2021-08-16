import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smartvac/component/historytile.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/modal/update.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  update u;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    pop(context),
                    SizedBox(width: 20,),
                    ptitle('Daily Readings '),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    child:u==null?Center(child: CircularProgressIndicator()):ListView(
                      children:u.data.map((e){
                        return ListTile(
                          leading: Icon(Icons.history),
                          title: Text(e.sum.toString() +" KWH"),
                          subtitle: Text(day(e.date)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getupdate();
  }

  getupdate()async {
    var url = Uri.parse('https://smartvac-api.herokuapp.com/list?id=1&freq=day');
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        setState(() {
          u =  update.fromJson(jsonDecode(response.body));
        });
      } else {
        print(response.body);
      }
    }catch(e){
    getupdate();
    }

  }
}

