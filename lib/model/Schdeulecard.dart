import 'package:flutter/material.dart';

import 'ScheduleModel.dart';


class Schdeulecard extends StatelessWidget {
  final ScheduleModel scheduleModel;
  var _imageheight = 30.0;
  var _imagewidth = 30.0;
  Schdeulecard({this.scheduleModel});


  TextStyle headStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);
  TextStyle textStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Quicksand',
      color: Colors.black);

  TextStyle textStyleTime = TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Quicksand',
      color: Colors.black);


//  TextStyle textStyleTitle = TextStyle(
//      fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black87);
//  TextStyle textStyleTitle1 = TextStyle(
//      fontSize: 14.0,
//      fontWeight: FontWeight.w500,
//      color: const Color(0xFFF8C300));
//  TextStyle textStyleTitle2 = TextStyle(
//      fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black87);
//  TextStyle hintStyle = TextStyle(
//    fontSize: 14.0,
//    fontWeight: FontWeight.w200,
//    fontFamily: 'Quicksand',
//  );
//  TextStyle textStyleTitle7 = TextStyle(
//      fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black87);
//  TextStyle textStyleTitle5 = TextStyle(
//      fontSize: 15.6, fontWeight: FontWeight.w500, color: Colors.grey[400]);
  @override
  Widget build(BuildContext context) {
//    return Card(
//      child: Column(
//        children: <Widget>[
//          ListTile(
//            leading: Icon(
//              Icons.menu,
//            ),
//            title: Text(
//              scheduleModel.title,
//              style: textStyleTitle,
//            ),
//            subtitle: Text(
//              scheduleModel.name,
//              style: textStyleTitle5,
//            ),
//            trailing: Text(scheduleModel.date),
//          )
//        ],
//      ),
//    );

    return Card(
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Icon(
            Icons.menu,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  scheduleModel.title,
                  style: headStyle,
                ),
                subtitle: Text(
                  scheduleModel.name,
                  style: textStyle,
                ),
                trailing: Text(scheduleModel.date,style: textStyleTime,),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            Icons.arrow_right,
          ),
        ),
      ]),
    );
  }
}
