import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/app_screens/dashboard_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/message_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/myteam_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/settings_screen.dart';
import 'package:xlive_switch/xlive_switch.dart';

import 'expense_list_screen.dart';
import 'profile_screen.dart';
import 'package:intl/intl.dart';

class NavigationDrawerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NavigationDrawerScreenState();
  }
}

class NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
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

  TextStyle textStylePunch = TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Quicksand',
      color: Colors.black);

  TextStyle navStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Quicksand',
      color: Colors.black);

  String punchstring = "";
  String timetodisplay = "00:00:00";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _value = true;
  bool _valueTimeout = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentTimeOn = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
//    String currentTimeOff = DateFormat('kk:mm:ss').format(now);

    //CONVERT STRING TO DATETIME
    String date = '2020-03-05 10:10:05';
   // String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
    DateTime dateTime = DateTime.parse(date);
    print(dateTime);

//CONVERT TO STRING FROM DATE TIME
    String currentTimeOff = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);  //yyyy-MM-dd
    print("STRING-->"+currentTimeOff);

//    DIFFERENCE OF DATETIMES
    final difference = now.difference(dateTime).inMinutes;
    print("difference-->"+difference.toString());

////
//    // String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
//    DateTime dateTimeee = DateTime.parse(difference.toString());
//    print(dateTimeee.hour+dateTimeee.minute+dateTimeee.millisecond);
////    String ddddd = DateFormat('mm').format(now);  //yyyy-MM-dd
////    print("TIMEEE-->"+ddddd);



    TextStyle rupeestyle = TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
//        fontFamily: 'Quicksand',
        color: Colors.black);

    TextStyle headStyleYellow = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

    print(_value);

    print(_valueTimeout);

    void _changeValue(bool value) {
      setState(() {
        _value = value;
        if (_value == true) {
          print("renturn 11");
          return null;
        } else {
          print("renturn 22");
          return showDialog(
                context: context,
                builder: (context) => new AlertDialog(
                  title: new Text('Item Secure',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                      )),
                  content: new Text(
                    'Are you sure you want to PunchOut?',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text('No'),
                      textColor: Colors.grey,
                    ),
                    new FlatButton(
/*          Navigator.of(context).pop(true)*/
                      onPressed: () {
                        setState(() {
                          _value == false;
                          Navigator.of(context).pop(true);
                        });
                      },
                      child: new Text('Yes'),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ) ??
              false;
        }
      });
    }

    void _changeValueTimeOut(bool valueTimeout) {
      setState(() {
        _valueTimeout = valueTimeout;
        if (_valueTimeout == false) {
          return null;
        } else {
          print("renturn 22");
          return showDialog(
                context: context,
                builder: (context) => new AlertDialog(
                  title: new Text('Item Secure',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                      )),
                  content: new Text(
                    'Enabling Time-Out will disable location tracking until you resume back. The Time-Out time will be deducted from your productive hours',
                    style: textStyle,
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text('No'),
                      textColor: Colors.grey,
                    ),
                    new FlatButton(
/*          Navigator.of(context).pop(true)*/
                      onPressed: () {
                        setState(() {
                          _valueTimeout == true;
                          Navigator.of(context).pop(true);
                        });
                      },
                      child: new Text('Yes'),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ) ??
              false;
        }
      });
    }

    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            ListTile(
              title: Text(
                "Khushali Thakkar",
                style: headStyle,
              ),
              subtitle: Text(
                "Android Developer",
                style: textStyle,
              ),
              leading: CircleAvatar(
                child: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                radius: 30,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return profile_screen();
                }));
              },
            ),
            Divider(
              height: 5,
              thickness: 0.5,
              color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Punched in : 23rd May 2014, 9:00 am',
                      style: textStylePunch,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: XlivSwitch(
                          value: _value,
                          onChanged: _changeValue,
                        ),
                      ))
                ],
              ),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
              color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //stoptimetodisplay
                  Expanded(
                    flex: 3,
                    child: Text(
                      'No Time-Outs Today',
                      style: textStylePunch,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      currentTimeOn,
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: XlivSwitch(
                          value: _valueTimeout,
                          onChanged: _changeValueTimeOut,
                        ),
                      ))
                ],
              ),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
              color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.group_work,
                color: Colors.black,
              ),
              title: Text(
                "My Team",
                style: navStyle,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyTeamScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.card_travel,
                color: Colors.black,
              ),
              title: Text(
                "Visit",
                style: navStyle,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DashbaroadScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.chat_bubble_outline,
                color: Colors.black,
              ),
              title: Text(
                "Message",
                style: navStyle,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return message_screen();
                }));
              },
            ),
            ListTile(
              leading:
                  Text('₹', style: rupeestyle, textAlign: TextAlign.center),
              title: Text(
                "Expenses",
                style: navStyle,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ExpenseListScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                "Settings",
                style: navStyle,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingsScreen();
                }));
              },
            ),
            Divider(
              height: 5,
              thickness: 0.5,
              color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.black,
              ),
              title: Text(
                "Logout",
                style: navStyle,
              ),
              onTap: () {
                //onIconPressed();
                return showDialog(
                      context: context,
                      builder: (context) => new AlertDialog(
                        title: new Text(
                          'Logout',
                          style: headStyle,
                        ),
                        content: new Text(
                          'Are you sure to logout?',
                          style: textStyle,
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: new Text('No'),
                            textColor: Colors.grey,
                          ),
                          new FlatButton(
/*          Navigator.of(context).pop(true)*/
                            onPressed: () => Navigator.of(context).pop(false),
                            child: new Text('Yes'),
                            textColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ) ??
                    false;
              },
            ),
          ],
        ),
      ),
    );
  }
}
