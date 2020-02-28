import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/adapters/Meetingcard.dart';
import 'package:flutter_itemsecure_dsr/app_screens/addvisit_screen.dart';
import 'package:flutter_itemsecure_dsr/app_screens/outcome_screen.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Meetinglist.dart';
import 'package:flutter_itemsecure_dsr/model/MeetingModel.dart';

import 'addexpense_screen.dart';

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

//  final List<NotesModel> notes = Noteslist.getNotesing();
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
  TextStyle titleaddStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);

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
    TextStyle rupeestyle = TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
//        fontFamily: 'Quicksand',
        color: Colors.white);

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
    TextStyle textStyletab = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Colors.black);

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'ABC Consultants',
              style: headStyle,
            ),
          ),
          actions: <Widget>[
            IconButton(
              // action button
              icon: Icon(
                Icons.build,
                color: Colors.transparent,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.all(5),
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
                                  color: Colors.grey,
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
                          ),
                          onTap: () {
//                            showDialog(
//                                context: context,
//                                builder: ((BuildContext context) {
//                                  return DynamicDialogCheckout();
//                                }));
                          },
                        ),
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
//                              Container(
//                                  child: IconTheme(
//                                    data: new IconThemeData(
//                                      color: Colors.white,
//                                    ),
//                                    child: new Icon(Icons.business_center),
//                                  ))
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return OutcomeScreen();
                            }));
                          },
                        ),
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
                                  child: Text(
                                '₹',
                                style: rupeestyle,
                              ))
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AddExpenseScreen();
                            }));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Text(
                            'Check-In',
                            style: textStyletab,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Text(
                            'Busy',
                            style: textStyletab,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Text(
                            'Outcome',
                            style: textStyletab,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Text(
                            'Expense',
                            style: textStyletab,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              _tabSection(context),
            ],
          ),
        ));
  }

//  Widget _buildAddNoteList() {
//    return Container(
//      child: notes.length > 0
//          ? ListView.builder(
//              itemCount: notes.length,
//              itemBuilder: (BuildContext context, int index) {
//                return Dismissible(
//                  onDismissed: (DismissDirection direction) {
//                    setState(() {
//                      notes.removeAt(index);
//                    });
//                  },
//                  secondaryBackground: Container(
//                    child: Center(
//                      child: Text(
//                        'Delete',
//                        style: TextStyle(color: Colors.white),
//                      ),
//                    ),
//                    color: Colors.red,
//                  ),
//                  background: Container(),
//                  child: Notescard(notesmodel: notes[index]),
//                  key: UniqueKey(),
//                  direction: DismissDirection.endToStart,
//                );
//              },
//            )
//          : Center(child: Text('No Items')),
//    );
//  }

  Widget _buildMoviesList() {
    return Expanded(
      flex: 1,
      child: Container(
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
                    child: Meetingcard(meetingModel: meetings[index],indexofmeeting: index,),
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                  );
                },
              )
            : Center(child: Text('No Items')),
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
    TextStyle selectedlable = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Colors.black);
    TextStyle unselectedlable = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              child: Padding(
            padding: EdgeInsets.all(5.0),
            child: TabBar(
                labelStyle: selectedlable,
                unselectedLabelStyle: unselectedlable,
                unselectedLabelColor: Theme.of(context).primaryColor,
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicator: ShapeDecoration(
                    color: const Color(0xFFF8C300),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: Theme.of(context).primaryColor))
//                    BeveledRectangleBorder(
//                        borderRadius: BorderRadius.circular(20),
//                        side: BorderSide(
//                          color: const Color(0xFFF8C300),
//                        ))
                    ),
                tabs: [
//                  Tab(
//                    child: Align(
//                        alignment: Alignment.center,
//                        child: ListTile(
//                            title: Text(
//                              "18 Feb 2020",
//                              style: textStyleTitle,
//                            ),
//                            subtitle: Text(
//                              "Android Developer \n Testing item secure",
//                              style: textStyleTitle,
//                            ),
//                            trailing: GestureDetector(
//                              onTap: () {
//                                showDialog(
//                                    context: context,
//                                    builder: ((BuildContext context) {
//                                      return Deletevisitedialog();
//                                    }));
//                              },
//                              child: Icon(Icons.cancel),
//                            ))),
//                  ),

                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Activity"),
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
          )),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              Container(
//                child: Text("Activity"),
                child: Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 7,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                      onTap: () {},
                                      title: Padding(
                                        padding: EdgeInsets.only(left: 0.0),
                                        child: Text(
                                          '18 Feb 2020',
                                          style: selectedlable,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Text(
                                              'Visit Subject',
                                              style: textStyleTitle,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Visit description',
                                                style: textStyleTitle,
                                              ),
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
                                        flex: 1,
                                        child: GestureDetector(
                                          child: Icon(
                                            Icons.mode_edit,
//                                        color: Colors.grey,
                                          ),
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return AddVisitScreen();
                                            }));
                                          },
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    ((BuildContext context) {
                                                  return Deletevisitedialog();
                                                }));
                                          },
                                          child: Icon(Icons.delete),
                                        ))
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _buildMoviesList()
                    ],
                  ),
                ),
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
                  child: Padding(
                padding: EdgeInsets.all(_padding),
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
              )),
              Container(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: const BoxConstraints.expand(height: 0.0),
                      ),
                      Padding(
                        padding: EdgeInsets.all(_padding),
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    icon: new Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: ((BuildContext context) {
                                            return addnotedialog();
                                          }));
                                    },
                                    child: Text(
                                      "Add Notes",
                                      style: titleaddStyle,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Divider(
                          height: 10,
                          thickness: 0.5,
                          color: Colors.grey.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "hiii",
                          style: textStyleTitle,
                        ),
                        trailing: Text(
                          "06:50 PM",
                          style: textStyleTitle,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: ((BuildContext context) {
                                return addnoteDetalisdialog();
                              }));
                        },
                      )
//                      Expanded(
//                        child: _buildAddNoteList(),
//                      )
                    ],
                  ),
                ),
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

class addnotedialog extends StatefulWidget {
//  DynamicDialog({this.title});

//  final String title;

  @override
  addnotedialog_sate createState() => addnotedialog_sate();
}

class addnotedialog_sate extends State<addnotedialog> {
  @override
  Widget build(BuildContext context) {
    TextStyle hintStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w200,
        fontFamily: 'Quicksand',
        color: Colors.grey[2]);

    TextStyle labelStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

    TextStyle textStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Colors.black);

    return Container(
      height: 250,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
//        title: Text(
//          "New Note",
//          textAlign: TextAlign.center,
//        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "New Note",
                textAlign: TextAlign.center,
              ),
              Container(
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.multiline,
                  style: textStyle,
                  maxLines: 5,
                  decoration: InputDecoration(
                      enabledBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: new UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      labelStyle: labelStyle,
                      hintText: 'Enter Description',
                      hintStyle: hintStyle,
                      labelText: 'Description'
//                                    contentPadding: const EdgeInsets.only(bottom: -10.0)

//                            filled: true,
                      ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: new Card(
                elevation: 5.0,
                color: Colors.black,
//          onPressed: null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                )),
                child: Padding(
                  child: Text('Save',
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(context).primaryColor)),
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 16.0, left: 16.0),
                )),
          ),
          new GestureDetector(
            onTap: () => Navigator.pop(context),
            child: new Card(
                color: Colors.black,
                elevation: 5.0,
//          onPressed: null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                )),
                child: Padding(
                  child: Text('Cancel',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  padding: EdgeInsets.all(10.0),
                )),
          )

//        FlatButton(
//            onPressed: () {
////              final newText = 'Updated Title!';
////              setState(() {
////                _title = newText;
////              });
//            },
//            child: Text('Filter')),
//        FlatButton(
//            onPressed: () {
////              final newText = 'Updated Title!';
////              setState(() {
////                _title = newText;
////              });
//            },
//            child: Text('Cancel')),
        ],
      ),
    );
  }
}

//class _DynamicDialogState extends State<DynamicDialog> {
//  String _title;
//
//  final List<String> _dropdownValues = [
//    "All",
//    "Pending Approval by Manager",
//    "Pending Approval by Accounts",
//    "Approved",
//    "Rejected by Manager",
//    "Rejected by Accounts",
//    "Disbursed",
//  ];
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    TextStyle hintStyleDropdown = TextStyle(
//        fontSize: 16.0,
//        fontWeight: FontWeight.w200,
//        fontFamily: 'Quicksand',
//        color: Theme.of(context).primaryColor);
//
//    TextStyle textStyle = TextStyle(
//        fontSize: 14.0,
//        fontWeight: FontWeight.w500,
//        fontFamily: 'Quicksand',
//        color: Colors.black);
//
//    return AlertDialog(
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.all(
//        Radius.circular(15),
//      )),
//      title: Text(
//        "Save Current Location",
//        textAlign: TextAlign.center,
//      ),
//      content: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          DropdownButtonFormField<String>(
//            style: textStyle,
//            decoration: InputDecoration(
////                                    contentPadding: EdgeInsets.all(_contentPadding),
//                contentPadding: EdgeInsets.all(0.0),
//                labelText: 'Select Type',
//                labelStyle: hintStyleDropdown,
////                                    prefixIcon: Icon(Icons.apps),
//                border: UnderlineInputBorder(
////                                      borderRadius: BorderRadius.circular(_borderradius),
//                    )),
//            isExpanded: false,
//            items: _dropdownValues.map((String dropdownstringitem) {
//              return DropdownMenuItem<String>(
//                value: dropdownstringitem,
//                child: Text(
//                  dropdownstringitem,
//                  style: textStyle,
//                ),
//              );
//            }).toList(),
//            onChanged: (String newvalueuser) {
//              setState(() {
//                FocusScope.of(context).requestFocus(new FocusNode());
//                this._title = newvalueuser;
//              });
////              _onDropDownItemSelected(newvalueuser);
//            },
//            value: _title,
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          DropdownButtonFormField<String>(
//            style: textStyle,
//            decoration: InputDecoration(
////                                    contentPadding: EdgeInsets.all(_contentPadding),
//                contentPadding: EdgeInsets.all(0.0),
//                labelText: 'Category Type',
//                labelStyle: hintStyleDropdown,
////                                    prefixIcon: Icon(Icons.apps),
//                border: UnderlineInputBorder(
////                                      borderRadius: BorderRadius.circular(_borderradius),
//                    )),
//            isExpanded: false,
//            items: _dropdownValues.map((String dropdownstringitem) {
//              return DropdownMenuItem<String>(
//                value: dropdownstringitem,
//                child: Text(
//                  dropdownstringitem,
//                  style: textStyle,
//                ),
//              );
//            }).toList(),
//            onChanged: (String newvalueuser) {
//              setState(() {
//                FocusScope.of(context).requestFocus(new FocusNode());
//                this._title = newvalueuser;
//              });
////              _onDropDownItemSelected(newvalueuser);
//            },
//            value: _title,
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          DropdownButtonFormField<String>(
//            style: textStyle,
//            decoration: InputDecoration(
////                                    contentPadding: EdgeInsets.all(_contentPadding),
//                contentPadding: EdgeInsets.all(0.0),
//                labelText: 'Select Territory',
//                labelStyle: hintStyleDropdown,
////                                    prefixIcon: Icon(Icons.apps),
//                border: UnderlineInputBorder(
////                                      borderRadius: BorderRadius.circular(_borderradius),
//                    )),
//            isExpanded: false,
//            items: _dropdownValues.map((String dropdownstringitem) {
//              return DropdownMenuItem<String>(
//                value: dropdownstringitem,
//                child: Text(
//                  dropdownstringitem,
//                  style: textStyle,
//                ),
//              );
//            }).toList(),
//            onChanged: (String newvalueuser) {
//              setState(() {
//                FocusScope.of(context).requestFocus(new FocusNode());
//                this._title = newvalueuser;
//              });
////              _onDropDownItemSelected(newvalueuser);
//            },
//            value: _title,
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          DropdownButtonFormField<String>(
//            style: textStyle,
//            decoration: InputDecoration(
////                                    contentPadding: EdgeInsets.all(_contentPadding),
//                contentPadding: EdgeInsets.all(0.0),
//                labelText: 'Select Industry',
//                labelStyle: hintStyleDropdown,
////                                    prefixIcon: Icon(Icons.apps),
//                border: UnderlineInputBorder(
////                                      borderRadius: BorderRadius.circular(_borderradius),
//                    )),
//            isExpanded: false,
//            items: _dropdownValues.map((String dropdownstringitem) {
//              return DropdownMenuItem<String>(
//                value: dropdownstringitem,
//                child: Text(
//                  dropdownstringitem,
//                  style: textStyle,
//                ),
//              );
//            }).toList(),
//            onChanged: (String newvalueuser) {
//              setState(() {
//                FocusScope.of(context).requestFocus(new FocusNode());
//                this._title = newvalueuser;
//              });
////              _onDropDownItemSelected(newvalueuser);
//            },
//            value: _title,
//          ),
//        ],
//      ),
//
////      DropdownButton(
////        items: _dropdownValues
////            .map((value) => DropdownMenuItem(
////          child: Text(value),
////          value: value,
////        )).toList(),
////        onChanged: (String value) {
////          setState(() {
////            _title = value;
////          });
////        },
////        value: _title,
////        isExpanded: false,
////        hint: Text('Select Number'),
////      ),
//
//      actions: <Widget>[
//        GestureDetector(
//          onTap: () => Navigator.pop(context),
//          child: new Card(
//              elevation: 5.0,
//              color: Colors.black,
////          onPressed: null,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.all(
//                Radius.circular(10.0),
//              )),
//              child: Padding(
//                child: Text('Filter',
//                    style: TextStyle(
//                        fontSize: 14, color: Theme.of(context).primaryColor)),
//                padding: EdgeInsets.only(
//                    top: 10.0, bottom: 10.0, right: 16.0, left: 16.0),
//              )),
//        ),
//        new GestureDetector(
//          onTap: () => Navigator.pop(context),
//          child: new Card(
//              color: Colors.black,
//              elevation: 5.0,
////          onPressed: null,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.all(
//                Radius.circular(10.0),
//              )),
//              child: Padding(
//                child: Text('Cancel',
//                    style: TextStyle(fontSize: 14, color: Colors.white)),
//                padding: EdgeInsets.all(10.0),
//              )),
//        )
//
////        FlatButton(
////            onPressed: () {
//////              final newText = 'Updated Title!';
//////              setState(() {
//////                _title = newText;
//////              });
////            },
////            child: Text('Filter')),
////        FlatButton(
////            onPressed: () {
//////              final newText = 'Updated Title!';
//////              setState(() {
//////                _title = newText;
//////              });
////            },
////            child: Text('Cancel')),
//      ],
//    );
//  }
//}

class addnoteDetalisdialog extends StatefulWidget {
//  DynamicDialog({this.title});

//  final String title;

  @override
  addnotedialogdetalis_sate createState() => addnotedialogdetalis_sate();
}

class addnotedialogdetalis_sate extends State<addnoteDetalisdialog> {
  @override
  Widget build(BuildContext context) {
    TextStyle hintStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w200,
        fontFamily: 'Quicksand',
        color: Colors.grey[2]);

    TextStyle labelStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

    TextStyle textStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Colors.black);
    var _imageheight = 30.0;
    var _imagewidth = 30.0;
    return Container(
      height: 250,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
//        title: Text(
//          "New Note",
//          textAlign: TextAlign.center,
//        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Note",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Hiiiii",
                  style: textStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                      children: <Widget>[
                        Icon(Icons.event_note),
//                          Image(
//                            image: AssetImage('images/art.png'),
//                            width: _imagewidth,
//                            height: _imageheight,
//                            color: Colors.black,
//                          ),

                        Expanded(
                          flex: 7,
                          child: ListTile(
                            title: Text(
                              "By Khushali Thakkar",
                              style: hintStyle,
                            ),
                            subtitle: Text(
                              "7 Feb 2020 9:00 am",
                              style: hintStyle,
                            ),
                          ),
                        )
                      ],
                    )),
            ],
          ),
        ),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.pop(context),
            child: new Card(
                color: Colors.black,
                elevation: 5.0,
//          onPressed: null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                )),
                child: Padding(
                  child: Text('Cancel',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  padding: EdgeInsets.all(10.0),
                )),
          )

//        FlatButton(
//            onPressed: () {
////              final newText = 'Updated Title!';
////              setState(() {
////                _title = newText;
////              });
//            },
//            child: Text('Filter')),
//        FlatButton(
//            onPressed: () {
////              final newText = 'Updated Title!';
////              setState(() {
////                _title = newText;
////              });
//            },
//            child: Text('Cancel')),
        ],
      ),
    );
  }
}

class Deletevisitedialog extends StatefulWidget {
//  DynamicDialog({this.title});

//  final String title;

  @override
  Deletevisitedialog_sate createState() => Deletevisitedialog_sate();
}

class Deletevisitedialog_sate extends State<Deletevisitedialog> {
  @override
  Widget build(BuildContext context) {
    TextStyle hintStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w200,
        fontFamily: 'Quicksand',
        color: Colors.grey[2]);

    TextStyle labelStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

    TextStyle textStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Colors.black);
    var _imageheight = 30.0;
    var _imagewidth = 30.0;
    return Container(
      height: 250,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
//        title: Text(
//          "New Note",
//          textAlign: TextAlign.center,
//        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Item Secure",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Are you sure you want to delete this visit ? ",
                  style: textStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: new Card(
                elevation: 5.0,
                color: Colors.black,
//          onPressed: null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                )),
                child: Padding(
                  child: Text('Yes',
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(context).primaryColor)),
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 10.0, right: 16.0, left: 16.0),
                )),
          ),
          new GestureDetector(
            onTap: () => Navigator.pop(context),
            child: new Card(
                color: Colors.black,
                elevation: 5.0,
//          onPressed: null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                )),
                child: Padding(
                  child: Text('No',
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                  padding: EdgeInsets.all(10.0),
                )),
          )

//        FlatButton(
//            onPressed: () {
////              final newText = 'Updated Title!';
////              setState(() {
////                _title = newText;
////              });
//            },
//            child: Text('Filter')),
//        FlatButton(
//            onPressed: () {
////              final newText = 'Updated Title!';
////              setState(() {
////                _title = newText;
////              });
//            },
//            child: Text('Cancel')),
        ],
      ),
    );
  }
}
