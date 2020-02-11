import 'dart:math';

import 'package:flutter/material.dart';

import '../model/ScheduleModel.dart';


class CheckInLayout extends StatelessWidget {
  final ScheduleModel scheduleModel;
  CheckInLayout({this.scheduleModel});

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
  @override
  Widget build(BuildContext context) {

    return Card(
      child: Row(children: <Widget>[
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
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            Icons.group,
          ),
        ),
      ]),
    );

  }
}
