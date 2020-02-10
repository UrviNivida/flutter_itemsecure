import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appointment_detail_screen.dart';
import 'employee_info_screen.dart';
import 'maps_appointmentlist_screen.dart';
import 'outcome_screen.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final List<Widget> _children = [
    EmployeeInfoScreen(),
    OutcomeScreen(),
    AppointmentDetailScreen(),
//    MapAppointmentListScreen()
    maps_appointmentlist_screen()

//    OutcomeScreen(),
//    EmployeeInfoScreen(),
//    PlaceholderWidget(Colors.white),
//    PlaceholderWidget(Colors.deepOrange),
//    PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Bottom Navigation Example"),
//      ),

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
//        index: 0,
        index: _page,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.filter_1, size: 30),
          Icon(Icons.filter_2, size: 30),
          Icon(Icons.filter_3, size: 30),
          Icon(Icons.filter_4, size: 30),
//          Icon(Icons.filter_5, size: 30),
        ],
        color: Theme.of(context).primaryColor,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: onTabTapped,
//        onTap: (index) {
//          setState(() {
//            _page = index;
//            print('Clicked 1 ---> ' + _page.toString());
//          }
//
//          );
//        },
      ),

      body: _children[_page],

//for navigation to another activity from tab click
//        https://inducesmile.com/google-flutter/how-to-route-to-a-new-page-from-bottom-navigation-bar-in-flutter/

//        body: Container(
//          color: Colors.blueAccent,
//          child: Center(
//            child: Column(
//              children: <Widget>[
////                Text(_page.toString(), textScaleFactor: 10.0),
////                RaisedButton(
////                  child: Text('Go To Page of index 1'),
////                  onPressed: () {
////                    final CurvedNavigationBarState navBarState =
////                        _bottomNavigationKey.currentState;
////                    navBarState.setPage(1);
////                  },
////                )
//              ],
//            ),
//          ),
//        )
//
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _page = index;
    });
  }

  Widget FirstTab(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('SecondScreen'),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
//            new Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
          ],
        ),
      ),
//      floatingActionButton: new FloatingActionButton(
////        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

//  Widget Pending(BuildContext context) {
//    return Scaffold(
//      body: FutureBuilder(
//          future: getDatapending(),
//          builder: (context, snapshot) {
//            return snapshot.data != null
//                ? listViewWidgetpending(snapshot.data)
//                : Center(child: CircularProgressIndicator());
//          }),
//    );
//  }
}
