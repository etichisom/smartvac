import 'package:flutter/material.dart';
import 'package:smartvac/screens/homes/history.dart';
import 'package:smartvac/screens/homes/home.dart';
import 'package:smartvac/screens/homes/settings.dart';
import 'package:smartvac/services/getuser.dart';

class Bnav extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Bnav> {
  List body = [Home(),Settings(),History()];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:body[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (i){
          setState(() {
            currentindex=i;
          });
        },
        items: [
          BottomNavigationBarItem(icon:Icon( Icons.home_outlined,),title: Text('home')),
          BottomNavigationBarItem(icon:Icon( Icons.settings),title: Text('settings'),backgroundColor: Colors.black),
          BottomNavigationBarItem(icon:Icon( Icons.history),title: Text('History')),
        ],
      ),
    );
  }

}
