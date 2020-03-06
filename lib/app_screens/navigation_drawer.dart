import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/app_screens/dashboard_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/message_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/myteam_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/settings_screen.dart';
import 'package:flutter_itemsecure_dsr/utils/prefs_file.dart';
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
  Prefs _prefs = new Prefs();
  String punchstring = "";
  String timetodisplay = "00:00:00";
  int totalTimeOut = 0;
  int prefstotalTimeOutDuration = 0;
  String prefsLastTimeOutTime = "0";
  bool prefsswitchbtn=false;

  @override
  void initState() {
    super.initState();
    _getPrefsData();


  }



  bool _value = true;
  bool _valueTimeout = false;

  String displayedDuration = "";
  DateTime now;
  String currentTimeOn = "2020-03-06 09:00:00";
  String currentTimeOff = "2020-03-06 11:00:00";

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");


  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

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
        now = DateTime.now();
        currentTimeOff = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
        //CONVERT STRING TO DATETIME
        DateTime dateTimeOn = DateTime.parse(currentTimeOn);
        print(dateTimeOn);
        DateTime dateTimeOff = DateTime.parse(currentTimeOff);
        print(dateTimeOff);

        //   DIFFERENCE OF DATETIMES
        var difference = dateTimeOff.difference(dateTimeOn).inSeconds;
        totalTimeOut = totalTimeOut + difference;

        if(prefstotalTimeOutDuration!="" && prefstotalTimeOutDuration!=0)
        {
          totalTimeOut=prefstotalTimeOutDuration;
          totalTimeOut = totalTimeOut + difference;
          displayedDuration = ConvertSectoDay(prefstotalTimeOutDuration);
          prefstotalTimeOutDuration = 0;
        }
        else{
          totalTimeOut = totalTimeOut + difference;
          displayedDuration = ConvertSectoDay(totalTimeOut);
        }
        _prefs.setLastTimeOutDuration(totalTimeOut);
        _prefs.setLastTimeOutTime("0");
        _prefs.setSwitchBtnTime(_valueTimeout);
        _getPrefsData();
        DurationTime();


        return null;
      } else {
        _valueTimeout == true;
        now = DateTime.now();
        currentTimeOn = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
        _prefs.setLastTimeOutTime(currentTimeOn);
        _prefs.setSwitchBtnTime(_valueTimeout);
        _getPrefsData();
        DurationTime();



        /* return
        showDialog(
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
*/ /*          Navigator.of(context).pop(true)*/ /*
                      onPressed: () {
                        setState(() {
                          _valueTimeout == true;
                          Navigator.of(context).pop(true);
                          now = DateTime.now();
                          currentTimeOn =
                              DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                          DurationTime();
                          print("presses yes--->"+currentTimeOn);
                        });
                      },
                      child: new Text('Yes'),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ) ??
              false;*/
      }
    });

//      });
  }

  Widget DurationTime() {
    if (_valueTimeout == false) {
      return Text(
        displayedDuration,
        textAlign: TextAlign.center,
        style: textStyle,
      );
    } else {
      return Text(
        currentTimeOn,
        textAlign: TextAlign.center,
        style: textStyle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
//    //CONVERT STRING TO DATETIME
//    String date = '2020-03-06 11:00:00';
//    // String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
//    DateTime dateTime = DateTime.parse(date);
//    print(dateTime);
//
////   CONVERT TO STRING FROM DATE TIME
//    String currentTimeOff =
//        DateFormat('yyyy-MM-dd HH:mm:ss').format(now); //yyyy-MM-dd
//    print("STRING-->" + currentTimeOff);
//
////   DIFFERENCE OF DATETIMES
//    var difference = now.difference(dateTime).inSeconds;
//    print("difference-->" + difference.toString());
//
//    ConvertSectoDay(difference.toInt());







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
                    child: DurationTime(),
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

  Future _getPrefsData() async {
    prefstotalTimeOutDuration = (await _prefs.getLastTimeOutDuration());
    prefsLastTimeOutTime = (await _prefs.getLastTimeOutTime());
    prefsswitchbtn = (await _prefs.getSwitchBtnTime());
    print("getLastTimeOutTime->"+prefsLastTimeOutTime);
    print("prefsswitchbtn->"+prefsswitchbtn.toString());
    setState(() {
      currentTimeOn=prefsLastTimeOutTime;
      _valueTimeout=prefsswitchbtn;
    });

  }

  String ConvertSectoDay(int n) {
//  double day = n / (24 * 3600);
//
//  n = n % (24 * 3600);
    int hour = (n / 3600).toInt();

    n %= 3600;
    int minutes = (n / 60).toInt();

    n %= 60;
    int seconds = n;

//    displayedDuration=hour.toString() + ":" + minutes.toString() + ":" + seconds.toString();
    String hr = "0";
    if (hour.toString().length == 1) {
      hr = "0" + hour.toString();
    } else {
      hr = hour.toString();
    }

    String min = "0";
    if (minutes.toString().length == 1) {
      min = "0" + minutes.toString();
    } else {
      min = minutes.toString();
      print("minutes-> false" + minutes.toString());
    }

    String sec = "0";
    if (seconds.toString().length == 1) {
      sec = "0" + seconds.toString();
    } else {
      sec = seconds.toString();
    }

    print("URVI->" +
        hour.toString() +
        ":" +
        minutes.toString() +
        ":" +
        seconds.toString());
    return hr + ":" + min + ":" + sec;
  }
}
