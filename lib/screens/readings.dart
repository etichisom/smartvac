import 'package:flutter/material.dart';
import 'package:smartvac/component/title.dart';

class Reading extends StatefulWidget {
  @override
  _ReadingState createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pop(context),
                SizedBox(width: 20,),
                pptitle('All Readings'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
