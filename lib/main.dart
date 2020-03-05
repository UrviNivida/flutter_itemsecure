import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_itemsecure_dsr/app_screens/addexpense_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/addvisit_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/checkin_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/employee_info_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/expense_list_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/map_appointmentlist_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/myteam_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/outcome_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/settings_screen.dart';
import 'package:flutter_itemsecure_dsr/utils/prefs_file.dart';

import 'app_screens/dashboard_screen.dart';
import 'app_screens/login_screen.dart';
import 'app_screens/bottom_navigation_screen.dart';
import 'app_screens/samplescreen.dart';
import 'app_screens/teamprofile_screen.dart';
import 'app_screens/todayvisits_screen.dart';

//https://vimeo.com/372583791
//https://pub.dev/packages/flutter_native_splash

//Column
//
//mainAxisAlignment: MainAxisAlignment.center => Center Column contents vertically,
//    crossAxisAlignment: CrossAxisAlignment.center => Center Column contents horizontally,
//    Row
//
//mainAxisAlignment: MainAxisAlignment.center => Center Row contents horizontally,
//    crossAxisAlignment: CrossAxisAlignment.center => Center Row contents vertically,

//void main() => runApp(MaterialApp(
//  theme: ThemeData(
//    primarySwatch: Colors.blue,
//  ),
//  home: Loginscreen(),
//));

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new MaterialApp(
      title: 'FluterSplashDemo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: const Color(0xFFF8C300),
          accentColor: const Color(0xFF212121),
          primaryColorDark: const Color(0xFFF8C300)
//        textTheme: TextTheme(
//          headline: TextStyle(fontSize: 72.0,
//              fontWeight: FontWeight.bold),
//          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
//          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
//        ),
          ),
      home: new Loginscreen()));
//      home: new SplashScreen()));
//      home: new CheckInScreen()));
//      home: new AddVisitScreen()));
//      home: new ExpenseListScreen()));
//      home: new BottomNavBar()));
//      home: new AddExpenseScreen()));
//      home: new OutcomeScreen()));
//      home: new SettingsScreen()));
//      home: new DashbaroadScreen()));
//      home: new MyTeamScreen()));
//      home: new MainCollapsingToolbar()));
//      home: new BarChartSample3()));
//      home: new TodayVisitsScreen()));
//      home: new StopWatchApp()));
}

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Prefs _prefs = new Prefs();
  var isLogin = '';

  bool equalsIgnoreCase(String string1, String string2) {
    return string1?.toLowerCase() == string2?.toLowerCase();
  }

  startTime() async {
    var _duration = new Duration(seconds: 8);
    print("111111" + isLogin);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (equalsIgnoreCase(isLogin, '1')) {
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//        return Home();
//      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EmployeeInfoScreen();
      }));
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
    _getPrefsData();
    print("222222" + isLogin);
  }

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        body: Container(
//      child: Expanded(child: new Image.asset('images/splashscreen.png')),
//    ));
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image.asset('images/splashscreen.png'),
      ]
//        children: <Widget>[
//          new Image.asset('images/splashscreen.png'),
//        ],
          ),
    );
  }

  Future _getPrefsData() async {
    isLogin = await _prefs.isLoggedIn();
    print("3333333" + isLogin);
  }
}
