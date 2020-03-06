import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/app_screens/dashboard_screen.dart';
import 'package:flutter_itemsecure_dsr/calender/table_calendar.dart';
import 'package:flutter_itemsecure_dsr/utils/prefs_file.dart';
import 'package:intl/intl.dart';


class select_datewisefilter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return select_datewisefilterState();
  }
}

class select_datewisefilterState extends State<select_datewisefilter>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;
  DateTime _selectedDay;
  List _selectedEvents;
  Map<DateTime, List> _holidayshhh = {};

  Prefs _prefs = new Prefs();

  String formattedDate;
  @override
  Widget build(BuildContext context) {
    TextStyle headStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.cancel, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Item Secure',
                    style: headStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            // action button
            icon: Icon(Icons.check_circle),
            onPressed: () {

              print("formattedDate-->"+formattedDate);

              _prefs.setSelectedDate(formattedDate);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
//                return DashbaroadScreen(formattedDate: formattedDate);

                return DashbaroadScreen();
              }));
            },
          ),
//          PopupMenuButton<Choice>( // overflow menu
//            onSelected: _select,
//            itemBuilder: (BuildContext context) {
//              return choices.skip(2).map<PopupMenuItem<Choice>>((Choice choice) {
//                return PopupMenuItem<Choice>(
//                  value: choice,
//                  child: Text(choice.title),
//                );
//              }).toList();
//            },
//          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          // _buildTableCalendarWithBuilders(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    formattedDate = DateFormat('yMMMd').format(_selectedDay);
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
      formattedDate = DateFormat('yMMMd').format(day);
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  Widget _buildTableCalendar() {
    return TableCalendar(

      calendarController: _calendarController,
      holidays: _holidayshhh,
      startingDayOfWeek: StartingDayOfWeek.monday,
//      startDay: ,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.yellow[400],
        todayColor: Colors.yellow[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.yellow[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }
}
