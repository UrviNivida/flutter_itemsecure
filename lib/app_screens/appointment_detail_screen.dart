import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/model/MeetingModel.dart';
import 'package:flutter_itemsecure_dsr/model/Meetingcard.dart';
import 'package:flutter_itemsecure_dsr/model/Meetinglist.dart';


class AppointmentDetailScreen extends StatefulWidget {
  @override
  _AppointmentDetailState createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetailScreen> {
  var _padding = 12.0;
  bool _value = true;
  var _imageheight = 40.0;
  var _imagewidth = 40.0;

  var _imagewidthSub = 28.0;
  var _imageheightSub = 28.0;

  var _circlePadding = 8.0;

  int cupertinoTabBarValue = 0;
  final List<MeetingModel> meetings = Meetinglist.getmeeting();
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;
  TextStyle textStyleTitleWhite = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Quicksand',
      color: Colors.white);
  TextStyle textStyleTitle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: 'Quicksand',
      color: Colors.black87);
  @override
  Widget build(BuildContext context) {
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
    TextStyle textStyleBlue = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Quicksand',
        color: Colors.black);

    TextStyle textStyleTitleBlue = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

    TextStyle hintStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w200,
      fontFamily: 'Quicksand',
    );

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 32,
            ),
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
                      'ABC Consultants',
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
              icon: Icon(
                Icons.build,
                size: 32,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(_padding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                          child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage('images/yellowcircle.png'),
                              width: _imagewidth,
                              height: _imageheight,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                              child: IconTheme(
                            data: new IconThemeData(
                              color: Colors.white,
                            ),
                            child: new Icon(Icons.group),
                          ))
                        ],
                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                          child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage('images/yellowcircle.png'),
                              width: _imagewidth,
                              height: _imageheight,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                              child: IconTheme(
                            data: new IconThemeData(
                              color: Colors.white,
                            ),
                            child: new Icon(Icons.add_call),
                          ))
                        ],
                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                          child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage('images/smile_fill.png'),
                              width: _imagewidth,
                              height: _imageheight,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
//                          Container(
//                              child: IconTheme(
//                                data: new IconThemeData(
//                                  color: Colors.white,
//                                ),
//                                child: new Icon(Icons.group),
//                              ))
                        ],
                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                          child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage('images/yellowcircle.png'),
                              width: _imagewidth,
                              height: _imageheight,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                              child: IconTheme(
                            data: new IconThemeData(
                              color: Colors.white,
                            ),
                            child: new Icon(Icons.attach_money),
                          ))
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              _tabSection(context),
            ],
          ),
        ));
  }

  Widget _buildMoviesList() {
    return Container(
      child: meetings.length > 0
          ? ListView.builder(
              itemCount: meetings.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      meetings.removeAt(index);
                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.red,
                  ),
                  background: Container(),
                  child: Meetingcard(meetingModel: meetings[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('No Items')),
    );
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
                unselectedLabelColor: const Color(0xFFF8C300),
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicator: ShapeDecoration(
                    color: const Color(0xFFF8C300),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: const Color(0xFFF8C300),
                        ))),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Activity",
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Contact"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Notes"),
                    ),
                  ),
                ]),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              Container(
//                child: Text("Activity"),
                child: _buildMoviesList(),
//                child: EasyDialog(
//                    cornerRadius: 15.0,
//                    fogOpacity: 0.1,
//                    width: 280,
//                    height: 180,
//                    contentPadding:
//                    EdgeInsets.only(top: 12.0), // Needed for the button design
//                    contentList: [
//                      Expanded(
//                        flex: 1,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.start,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Padding(padding: EdgeInsets.only(left: 30.0)),
//                            Text(
//                              "Rate",
//                              style: TextStyle(fontWeight: FontWeight.bold),
//                              textScaleFactor: 1.3,
//                            ),
//                            Padding(padding: EdgeInsets.only(left: 10.0)),
//                            Row(
//                              mainAxisSize: MainAxisSize.min,
//                              children: List.generate(5, (index) {
//                                return Icon(
//                                  index < 3 ? Icons.star : Icons.star_border,
//                                  size: 30.0,
//                                  color: Colors.orange,
//                                );
//                              }),
//                            )
//                          ],
//                        ),
//                      ),
//                      Expanded(
//                          flex: 3,
//                          child: Padding(
//                            padding: EdgeInsets.all(10.0),
//                            child: TextFormField(
//                              maxLines: 5,
//                              decoration: InputDecoration(
//                                border: InputBorder.none,
//                                hintText: "Add review",
//                              ),
//                            ),
//                          )),
//                      Container(
//                        width: double.infinity,
//                        decoration: BoxDecoration(
//                            color: Colors.greenAccent,
//                            borderRadius: BorderRadius.only(
//                                bottomLeft: Radius.circular(10.0),
//                                bottomRight: Radius.circular(10.0))),
//                        child: FlatButton(
//                          onPressed: () {
//                            Navigator.of(context).pop();
//                          },
//                          child: Text(
//                            "Rate",
//                            textScaleFactor: 1.3,
//                          ),
//                        ),
//                      ),
//                    ]).show(context),
              ),
              Container(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: const BoxConstraints.expand(height: 0.0),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_padding),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  child: Padding(
                                    padding: EdgeInsets.all(_circlePadding),
                                    child: Text(
                                      '305, Privilege Avenue, Opp. isha hospital, Behind atlantis Sarabhai campus, Sarabhai Rd, Vadiwadi, Vadodara, Gujarat 390023',
                                      style: textStyleTitle,
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: _padding),
                                      child: Container(),
                                    ),
                                    Container(
                                        child: IconTheme(
                                      data:
                                          new IconThemeData(color: Colors.grey),
                                      child: new Icon(Icons.location_on),
                                    ))
                                  ],
                                ))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_padding),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 0,
                              child: GestureDetector(
                                onTap: () {
//                Alert(
//                    context: context,
//                    title: "",
//                    content: Form(
//                      child: new Column(
//                        children: <Widget>[
//                          CircleAvatar(
//                            backgroundImage: NetworkImage(
//                                "http://app.nivida.in/bita_rjvision/files/upload_document/" +
//                                    widget.image_path),
//                            minRadius: 50,
//                            maxRadius: 90,
//                          ),
//                        ],
//                      ),
//                    )).show();
                                  //Insert event to be fired up when button is clicked here
                                  //in this case, this increments our `countValue` variable by one.
                                },
                                child: new Container(
                                    width: _imagewidth,
                                    height: _imageheight,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: new NetworkImage(
                                              "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg"),
                                        ))),
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: GestureDetector(
                                  child: Padding(
                                    padding: EdgeInsets.all(_circlePadding),
                                    child: Text(
                                      'Nilesh Shah',
                                      style: textStyleTitle,
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 4,
                                child: GestureDetector(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: _padding),
                                      child: Container(
                                          child: IconTheme(
                                        data: new IconThemeData(
                                            color: Colors.grey),
                                        child: new Icon(Icons.chat_bubble),
                                      )),
                                    ),
                                    Container(
                                        child: IconTheme(
                                      data:
                                          new IconThemeData(color: Colors.grey),
                                      child: new Icon(Icons.call),
                                    ))
                                  ],
                                ))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_padding),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Image(
                                      image:
                                          AssetImage('images/yellowcircle.png'),
                                      width: _imagewidth,
                                      height: _imageheight,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Container(
                                    child: IconTheme(
                                      data: new IconThemeData(
                                        color: Colors.white,
                                      ),
                                      child: new Icon(Icons.business_center),
                                    ),
                                  )
                                ],
                              )),
                            ),
                            Expanded(
                                flex: 4,
                                child: GestureDetector(
                                  child: Padding(
                                    padding: EdgeInsets.all(_circlePadding),
                                    child: Text(
                                      'Boardline',
                                      style: textStyleTitle,
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 4,
                                child: GestureDetector(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: _padding),
                                      child: Container(),
                                    ),
                                    Container(
                                        child: IconTheme(
                                      data:
                                          new IconThemeData(color: Colors.grey),
                                      child: new Icon(Icons.call),
                                    ))
                                  ],
                                ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Text("Notes"),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _changeValue(bool value) {
    setState(() {
      _value = value;
    });
  }
}
