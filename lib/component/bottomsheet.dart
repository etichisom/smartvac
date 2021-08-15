import 'package:flutter/material.dart';

import 'notification.dart';

bottom(BuildContext context,Size size) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
      ),
      context: context, builder:(context){
    return Container(
      width: size.width,
      decoration: BoxDecoration(
      ),
      height: 500,
      child: notification(),
    );
  });
}