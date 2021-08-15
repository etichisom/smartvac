import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartvac/modal/user.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smartvac/background/notification.dart';
import 'package:smartvac/screens/splash.dart';
import 'package:smartvac/services/socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher(){
  Workmanager().executeTask((task, inputData) {
    final channel = WebSocketChannel.connect(
      Uri.parse('ws://smartvac-api.herokuapp.com/ws'),
    );
    FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSetttings = InitializationSettings(android: android,iOS: iOS);
    flp.initialize(initSetttings);
    getdata(flp);
    return Future.value(true);
  });
}

getdata(FlutterLocalNotificationsPlugin flp)async{
 var d = DateTime.now();
 if(d.hour>18 && d.hour<21){
   showNotification('Reminder to turn of your lights', flp);
 }else{

 }
}