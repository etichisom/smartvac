
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loader{
  BuildContext context;

  loader(this.context);
  showloader (){
    showDialog(
        barrierColor: Colors.transparent,
        context: context, builder:(context){
      return Dialog(
        insetPadding: EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        child: Center(child: CircularProgressIndicator()),
      );
    }) ;
  }
  pop(){
    Navigator.pop(context);
  }
}