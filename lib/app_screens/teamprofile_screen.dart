import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MainCollapsingToolbar extends StatefulWidget {
  @override
  _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
}

class _MainCollapsingToolbarState extends State<MainCollapsingToolbar> {
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
                      icon: new Icon(
                        Icons.cancel,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
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
                                  textDirection: TextDirection.ltr,
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
                        ),
                        onPressed: () {},
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
                        AppBar(
                          elevation: 0.0,
                          leading: new IconButton(
                            icon: new Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          automaticallyImplyLeading: false,
                          actions: <Widget>[
                            IconButton(
                              // action button
                              icon: Icon(
                                Icons.info,
                              ),
                              onPressed: () {},
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
                              onTap: () => Navigator.pop(context),
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
                              onTap: () => Navigator.pop(context),
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
                  child: Text('Visits this week',textAlign: TextAlign.center,style: headStyleName,),
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
