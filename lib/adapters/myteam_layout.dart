import 'dart:math';

import 'package:flutter/material.dart';

import '../model/ScheduleModel.dart';


class MyTeamLayout extends StatelessWidget {
  final ScheduleModel scheduleModel;
  MyTeamLayout({this.scheduleModel});

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
  TextStyle textStyleLocation = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Quicksand',
      color: Colors.grey);

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
                leading: CircleAvatar(
                  child: Icon(
                    Icons.perm_identity,
                    color: Colors.white,
                  ),
                  radius: 30,
                ),
                title: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    scheduleModel.title,
                    style: headStyle,
                  ),
                ),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        scheduleModel.name,
                        style: textStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          scheduleModel.name,
                          style: textStyleLocation,
                        ),
                      ],
                    )
                  ],
                )

              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.info_outline,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Visits',
                      style: textStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '0',
                          style: headStyle,
                        ),
                        Text(
                          '/',
                          style: textStyle,
                        ),
                        Text(
                          '3',
                          style: textStyle,
                        ),
                      ],
                    )
                  ],
                )
              )
            ],
          )
        ),
      ]),
    );

  }
}
