import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:smartvac/component/historytile.dart';
import 'package:smartvac/component/title.dart';
import 'package:smartvac/modal/historymodel.dart';
import 'package:smartvac/services/payment_history.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
            SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                title('History'),
                 Text('clear history',style: GoogleFonts.poppins(fontSize: 11,),),
               ],
             ),
             //SizedBox(height: 30,),
             SizedBox(height: 20,),
             Expanded(
               child:p==null?Center(child: CircularProgressIndicator(),):
               p.data.toList().length==0?Center(
                 child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("you've not performed any transaction",style: GoogleFonts.roboto(
                       fontSize: 17
                     ),),
                     SizedBox(height: 10,),
                    Container(
                      height: 200,
                        child: Image.asset('assest/h.png',fit: BoxFit.contain,))
                   ],
                 ),
               ):Container(
                 child: ListView(
                   physics: BouncingScrollPhysics(),
                   children: p.data.reversed.toList().map((e){
                     return histile(e,size);
                   }).toList(),
                 ),
               ),
             )
           ],
         ),
       ),
     ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gethistory();
  }

   gethistory() {
    payhis().gethistory().then((value) {
      p=value;
      setState(() {});
    });
   }
}
