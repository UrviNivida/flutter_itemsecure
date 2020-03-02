import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:flutter_itemsecure_dsr/adapters/todayvisit_layout.dart';
import 'package:flutter_itemsecure_dsr/app_screens/expense_list_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/punchinmap_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/todayvisits_screen.dart';


import 'chat_screen.dart';
import 'currentLocation_screen.dart';
import 'package:intl/intl.dart';

class TeamProfileScreen extends StatefulWidget {
  @override
  _TeamProfileScreenState createState() => _TeamProfileScreenState();
}

class _TeamProfileScreenState extends State<TeamProfileScreen> {
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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              actions: <Widget>[
                IconButton(
                  // action button
                  icon: Icon(
                    Icons.info,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((BuildContext context) {
                          return Clickedialog();
                        }));
                  },
                ),
              ],
              automaticallyImplyLeading: false,
//              bottom: PreferredSize(
//                preferredSize: Size.fromHeight(50),
//                child: Container(),
//              ),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.all(0.0),
                  title: AppBar(
                    backgroundColor: Colors.transparent,
//                    brightness: Brightness.light,
                    elevation: 0.0,
                    leading: new IconButton(
                      alignment: Alignment.centerRight,
                      icon: new Icon(Icons.cancel),
                      onPressed: () => Navigator.of(context).pop(null),
                    ),
                    title: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
//                                print(
//                                    "http://app.nivida.in/bita_rjvision/files/upload_document/" +
//                                        snapshot.data.data.user.iMAGEURL);

                            //Insert event to be fired up when button is clicked here
                            //in this case, this increments our `countValue` variable by one.
                          },
                          child: new Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg"),
                                  ))),
                        ),
                        new Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  'Urvi Suthar',
                                  style: headStyleName,
                                ),
                                subtitle: Text(
                                  'Designation',
//                                  textDirection: TextDirection.ltr,
                                  style: textStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconButton(
                        // action button
                        icon: Icon(
                          Icons.info,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: ((BuildContext context) {
                                return Clickedialog();
                              }));
                        },
                      ),
                    ],
                    automaticallyImplyLeading: false,
                  ),
                  background: Container(
                    alignment: Alignment.topCenter,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
//                        ListTile(
//                          leading: new IconButton(
//                            icon: new Icon(
//                              Icons.cancel,
//                              color: Colors.black,
//                            ),
//                            onPressed: () => Navigator.of(context).pop(),
//                          ),
//                          trailing: IconButton(
//                            // action button
//                            icon: Icon(
//                              Icons.info,
//                              color: Colors.black,
//                            ), onPressed: () => Navigator.of(context).pop(),
//                          ),
//                        ),
                        AppBar(
                          elevation: 0.0,
                          leading: new IconButton(
                            icon: new Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                            onPressed: () => Navigator.of(context).pop(true),
//                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          automaticallyImplyLeading: false,
                        ),
                        GestureDetector(
                          onTap: () {
//                                print(
//                                    "http://app.nivida.in/bita_rjvision/files/upload_document/" +
//                                        snapshot.data.data.user.iMAGEURL);

                            //Insert event to be fired up when button is clicked here
                            //in this case, this increments our `countValue` variable by one.
                          },
                          child: new Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg"),
                                  ))),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Urvi Suthar',
                          style: headStyle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Designation',
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Reports To : Urvi Suthar',
                          textAlign: TextAlign.center,
                          style: textStylereport,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new GestureDetector(
//                              onTap: () => DialPad(
//                                  enableDtmf: true,
//                                  backspaceButtonIconColor: Colors.red,
//                                  makeCall: (number){
//                                    print(number);
//                                  }
//                              ),
                              child: new Card(
                                  color: Colors.black,
                                  elevation: 10.0,
//          onPressed: null,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  )),
                                  child: Padding(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.call,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text('Call', style: headStylecall),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                  )),
                            ),
                            new GestureDetector(
                              onTap: () {
                                DateTime now = DateTime.now();
                                String formattedDate =
                                DateFormat('EEE d MMM kk:mm').format(now);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => chat_screen(
                                            name: 'ABC XYZ',
                                            formattedDate: formattedDate)));
                                print('ABC XYZ');
                              },
                              child: new Card(
                                  color: Colors.black,
                                  elevation: 10.0,
//          onPressed: null,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  )),
                                  child: Padding(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.chat_bubble,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text('Message', style: headStylecall),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ];
        },
        body: Container(
          child: ListView(
            children: <Widget>[
              Card(
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                'Current Location',
                                style: textStylereport,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'On Field',
                                    style: textStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.directions_walk,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '305 nivida web solution privilege building vadodara 390002',
                                        style: textStyleaddress,
                                        overflow: TextOverflow.ellipsis,
//                                        overflow: TextOverflow.fade,
                                        maxLines: 2,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return currentLocation_screen();
//                                return MapPage();
                              }));
                        },)
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
                                    'Now',
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
              ),
              Card(
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                'Punched-In',
                                style: textStylereport,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'From',
                                    style: textStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.touch_app,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '305 nivida web solution privilege building vadodara 390002',
                                        style: textStyleaddress,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return punchin_screen();
                              }));
                        },)
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
              ),
              Card(
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                'Visits',
                                style: textStylereport,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Next',
                                    style: textStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Urvi Suthar, Predding , Vadodara',
                                        style: textStyleaddress,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return TodayVisitsScreen();
                                }));
                          },)
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
              ),
              Card(
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            title: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                'Expenses',
                                style: textStylereport,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Last',
                                    style: textStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Pooja - ₹ 380.0',
                                        style: textStyleaddress,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return ExpenseListScreen();
                                }));
                          },)
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '₹ 380.0',
                                        style: textStyle,
                                      ),
                                    ],
                                  )
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
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Visits this week',
                    textAlign: TextAlign.center,
                    style: headStyleName,
                  ),
                ),
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                color: const Color(0xff2c4260),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 20,
                    barTouchData: BarTouchData(
                      enabled: false,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        tooltipPadding: const EdgeInsets.all(0),
                        tooltipBottomMargin: 8,
                        getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                        ) {
                          return BarTooltipItem(
                            rod.y.round().toString(),
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: SideTitles(
                        showTitles: true,
                        textStyle: weekStyle,
                        margin: 20,
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        textStyle: weekStyle,
                        margin: 20,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Mon';
                            case 1:
                              return 'Tue';
                            case 2:
                              return 'Wed';
                            case 3:
                              return 'Thr';
                            case 4:
                              return 'Fri';
                            case 5:
                              return 'Sat';
                            case 6:
                              return 'Sun';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: const SideTitles(showTitles: false),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(y: 8, color: Colors.lightBlueAccent)
                      ], showingTooltipIndicators: [
                        0
                      ]),
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(y: 10, color: Colors.lightBlueAccent)
                      ], showingTooltipIndicators: [
                        0
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(y: 14, color: Colors.lightBlueAccent)
                      ], showingTooltipIndicators: [
                        0
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(y: 15, color: Colors.lightBlueAccent)
                      ], showingTooltipIndicators: [
                        0
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(y: 13, color: Colors.lightBlueAccent)
                      ], showingTooltipIndicators: [
                        0
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(y: 10, color: Colors.lightBlueAccent)
                      ], showingTooltipIndicators: [
                        0
                      ]),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Clickedialog extends StatefulWidget {
//  DynamicDialog({this.title});

//  final String title;

  @override
  Clickedialog_sate createState() => Clickedialog_sate();
}

class Clickedialog_sate extends State<Clickedialog> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Colors.black);
    TextStyle textStyleTitle = TextStyle(
        fontSize: 14.0,
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w500,
        color: const Color(0xFFF8C300));
    var _imageheight = 30.0;
    var _imagewidth = 30.0;
    return Container(
      height: 250,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Khushali Thakkar",
                          style: textStyle,
                        ),
                        Text(
                          "Manager",
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Report To",
                      style: textStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Urvi Suthar",
                      style: textStyleTitle,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Divider(
                  height: 10,
                  thickness: 0.5,
                  color: Colors.grey.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Team",
                      style: textStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Khushali Thakkar",
                      style: textStyleTitle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
