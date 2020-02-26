import 'dart:math';

import 'package:flutter/material.dart';

import '../model/ScheduleModel.dart';


class TodayVisitsLayout extends StatelessWidget {
  final ScheduleModel scheduleModel;
  TodayVisitsLayout({this.scheduleModel});
  TextStyle headStyleName = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);
  TextStyle headStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);
  TextStyle textStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Quicksand',
      color: Colors.black);
  TextStyle textStyleaddress = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Quicksand',
      color: Colors.black);

  TextStyle textStylereport = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black54);

  TextStyle headStylecall = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.white);

  TextStyle weekStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: const Color(0xff7589a2));
  @override
  Widget build(BuildContext context) {

    return Card(
      child: Row(children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Urvi Suthar , Pre-wedding',
                      style: textStyleaddress,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Untitled',
                          style: textStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.restore,
                            color: Theme.of(context).primaryColor,
                          ),
                          Expanded(
                            child: Text(
                              'Pending',
                              style: textStylereport,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '07:50 PM',
                          style: textStyle,
                        ),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
      ]),
    );

  }
}
