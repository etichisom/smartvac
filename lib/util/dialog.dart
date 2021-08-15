import 'package:flutter/cupertino.dart';

class dia{
  BuildContext context;
  String info;
  String title;

  dia(this.context,this.info,this.title);
   dialog(){
     showCupertinoDialog(
       context: context,
       builder: (context) => CupertinoAlertDialog(
         title: Text(title),
         content: Text(info),
         actions: <Widget>[
           CupertinoDialogAction(
               child: Text('ok'),
               onPressed: () => Navigator.of(context).pop(false),
             ),
           CupertinoDialogAction(
             child: Text('close'),
             onPressed: () => Navigator.of(context).pop(true),
           ),
         ],
       ),
     );
   }
}