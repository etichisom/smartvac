import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartvac/screens/splash.dart';
import 'package:workmanager/workmanager.dart';

import 'background/workmanger.dart';
const simplePeriodicTask = "simplePeriodicTask";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isAndroid){
    Workmanager().initialize(
        callbackDispatcher, 
        isInDebugMode: false,
    );
  }
  runApp( DevicePreview(
    enabled: false,
    builder: (context) => MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Splash()
    );
  }
}

