import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget use(){
  return SizedBox(
    height: 160,
    width: 160,
    child: CircularProgressIndicator(
      strokeWidth: 20,

      value: 0.7,
    ),
  );
}