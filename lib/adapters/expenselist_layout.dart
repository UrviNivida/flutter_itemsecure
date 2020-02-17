import 'dart:math';

import 'package:flutter/material.dart';

import '../model/ScheduleModel.dart';

class ExpenseListLayout extends StatelessWidget {
  final ScheduleModel scheduleModel;

  ExpenseListLayout({this.scheduleModel});

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

  TextStyle textstatusStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Quicksand',
      color: Colors.grey);

  TextStyle valueStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Text(
                    scheduleModel.title,
                    style: headStyle,
                  ),
                  subtitle: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        scheduleModel.name,
                        style: textStyle,
                      ),
                      Text(
                        scheduleModel.statusexp,
                        style: textstatusStyle,
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '₹ ' + scheduleModel.rupees.toString(),
            style: valueStyle,
          ),
        ),
      ]),
    );
  }
}
