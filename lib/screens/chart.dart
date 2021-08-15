
import 'dart:convert';

import 'package:fcharts/fcharts.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/modal/usauage.dart';
import 'package:smartvac/services/socket.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<useage> data=[];
  Stream stream1;
  var date = DateTime.now();
  TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              pop(context),
              SizedBox(height: 20,),
              ptitle('Energy Readings '),
              SizedBox(height: 13,),
              ntitle('Detailed analysis of energy usage. '),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  pickdate(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Container(
                     width: size.width-60,
                     decoration: BoxDecoration(
                       color: Colors.grey[200],
                       borderRadius: BorderRadius.circular(20)
                     ),
                       child: Padding(
                       padding: const EdgeInsets.all(3),
                       child: Center(child: Row(
                         children: [
                           Expanded(child: Container()),
                           fdate(),
                           Expanded(child: Container()),
                           Icon(Icons.keyboard_arrow_down)
                         ],
                       )
                       ),
                   ))
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                flex: 2,
                  child: Container(
                child: StreamBuilder<dynamic>(
                  stream: stream1,
                  builder: (context, snapshot) {
                    if(snapshot.data==null){
                      return Center(child: CircularProgressIndicator());
                    }
                    setdata(snapshot);
                    return Column(
                      children: [
                     Expanded(
                       child: Container(
                         child:  SfCartesianChart(
                           plotAreaBorderWidth: 0,
                           series: <ChartSeries>[
                             LineSeries<useage,double>(dataSource:data,
                               xValueMapper: (useage use,_)=>use.date,
                               yValueMapper: (useage use,_)=>use.unit,
                               markerSettings: const MarkerSettings(isVisible: true),
                               dataLabelSettings: DataLabelSettings(isVisible: true)
                             ),

                           ],
                           tooltipBehavior: TooltipBehavior(enable: true),
                           primaryXAxis: NumericAxis(
                               majorGridLines: const MajorGridLines(width: 0),
                             labelFormat: '{value}h',
                           ),
                           primaryYAxis: NumericAxis(
                               axisLine: const AxisLine(width: 0),
                               labelFormat: '{value}KWh',
                               edgeLabelPlacement: EdgeLabelPlacement.shift,
                               majorTickLines: const MajorTickLines(size: 0)),
                         ),
                       ),
                     )


                    ],
                    );
                  }
                ),
              )),
              Expanded(
                flex: 1,
                  child: Container()),

        ],
      ),
          )),
    );
  }

   setdata(AsyncSnapshot snapshot) {
     var s = jsonDecode(snapshot.data);
     socket soc = socket.fromJson(s);
     data.clear();
     soc.readings.forEach((element) {
       double dunit = element.sum.toDouble();
       var parsedDate = DateTime.parse(element.date);
       if(parsedDate.month == date.month && parsedDate.day ==date.day && parsedDate.year==date.year){
         print(element.sum);
         print(parsedDate.hour);
         data.add(useage(element.sum.toDouble(), parsedDate.hour.toDouble()));

       }

     });
     if(data.length == 1){
       data.add(useage(0, 0));
     }
     print(data.length);


   }
@override
  void initState() {
   stream1 = WebSocketChannel.connect(
     Uri.parse('ws://smartvac-api.herokuapp.com/ws'),
   ).stream.asBroadcastStream();
    super.initState();
  }
 @override
  void dispose() {

    super.dispose();
  }

 Widget fdate() {
  var dday = Jiffy({
     "year": date.year,
     "month": date.month,
     "day": date.day,
     "hour": date.hour
   }).yMMMEd;
  return mtitle(dday.toString());
 }

   pickdate(BuildContext context) async {
    var fday =  await showDatePicker(
       context: context,
       initialDate: date,
       firstDate: DateTime(2000),
       lastDate: DateTime.now(),
    );
    print(fday);
    if(fday != null){
      setState(() {
       date = fday;

      });
    }


   }

}

