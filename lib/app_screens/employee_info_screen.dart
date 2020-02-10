import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlive_switch/xlive_switch.dart';

class EmployeeInfoScreen extends StatefulWidget {
  @override
  _EmployeeInfoScreenState createState() => _EmployeeInfoScreenState();
}

class _EmployeeInfoScreenState extends State<EmployeeInfoScreen> {
  var _padding = 8.0;
  bool _value = true;
  var _imageheight = 40.0;
  var _imagewidth = 40.0;

  var _imagewidthSub = 28.0;
  var _imageheightSub = 28.0;

  var _circlePadding = 8.0;

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
    TextStyle textStyleTitle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Colors.black87);

    TextStyle textStyleTitleBlue = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

    TextStyle textStyleTitleWhite = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Colors.white);

    TextStyle hintStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w200,
      fontFamily: 'Quicksand',
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                      style: headStyle,
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

//        Row(
////          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            GestureDetector(
//              onTap: () {
////                Alert(
////                    context: context,
////                    title: "",
////                    content: Form(
////                      child: new Column(
////                        children: <Widget>[
////                          CircleAvatar(
////                            backgroundImage: NetworkImage(
////                                "http://app.nivida.in/bita_rjvision/files/upload_document/" +
////                                    widget.image_path),
////                            minRadius: 50,
////                            maxRadius: 90,
////                          ),
////                        ],
////                      ),
////                    )).show();
//                //Insert event to be fired up when button is clicked here
//                //in this case, this increments our `countValue` variable by one.
//              },
//              child: new Container(
//                  width: 50.0,
//                  height: 50.0,
//                  decoration: new BoxDecoration(
//                      shape: BoxShape.circle,
//                      image: new DecorationImage(
//                        fit: BoxFit.fill,
//                        image: new NetworkImage(
//                            "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg"),
//                      ))),
//            ),
//            Padding(
//                padding: EdgeInsets.all(5.0),
////              child: Column(
//////                mainAxisAlignment: MainAxisAlignment.center,
////                children: <Widget>[
////                  Text(
////                    'Urvi Suthar',
////                    style: headStyle,
////                  ),
////                  Text(
////                    'Designation',
////                    textDirection: TextDirection.ltr,
////                    style: textStyle,
////                  ),
////                ],
////              ),
//                child: ListTile(
//                  title: Text(
//                    'Urvi Suthar',
//                    style: headStyle,
//                  ),
//                  subtitle: Text(
//                    'Designation',
//                    textDirection: TextDirection.ltr,
//                    style: textStyle,
//                  ),
//                )),
//          ],
//        ),
        actions: <Widget>[
          IconButton(
            // action button
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(_padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    'Punched in : 23rd May 2014, 9:00 am',
                    style: textStyleBlue,
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
                        child: new Icon(Icons.location_on),
                      ))
                    ],
                  )),
                ),
                Expanded(
                    flex: 4,
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(_circlePadding),
                        child: Text(
                          'Appointments (5 today)',
                          style: textStyleTitle,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: GestureDetector(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Add New ',
                          style: textStyleTitleBlue,
                        ),
                        IconTheme(
                          data: new IconThemeData(
                            color: Theme.of(context).primaryColor,
                          ),
                          child: new Icon(Icons.add),
                        )
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
                          image: AssetImage('images/yellowcircle.png'),
                          width: _imagewidth,
                          height: _imageheight,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                          child: IconTheme(
                        data: new IconThemeData(color: Colors.white),
                        child: new Icon(Icons.message),
                      )

//                            Image(
//                              image: AssetImage('images/whitepin.png'),
//                              width: _imagewidthSub,
//                              height: _imageheightSub,
//                            ),
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
                          'Messages',
                          style: textStyleTitle,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: GestureDetector(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: 2.0, bottom: 2.0, right: 6.0, left: 6.0),
                          color: Colors.red,
                          child: Text(
                            '3',
                            style: textStyleTitleWhite,
                          ),
                        )
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
                          child: new Icon(Icons.info),
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
                          'Alerts',
                          style: textStyleTitle,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: GestureDetector(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: 2.0, bottom: 2.0, right: 6.0, left: 6.0),
                          color: Colors.red,
                          child: Text(
                            '14',
                            style: textStyleTitleWhite,
                          ),
                        )
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
                          child: new Icon(Icons.explicit),
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
                          'Expenses',
                          style: textStyleTitle,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: GestureDetector(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Approved : 1023',
                          style: textStyleTitleBlue,
                        ),
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
                          child: new Icon(Icons.calendar_today),
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
                          'Calender',
                          style: textStyleTitle,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: GestureDetector(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[],
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
                          child: new Icon(Icons.settings),
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
                          'Settings',
                          style: textStyleTitle,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: GestureDetector(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[],
                    ))),
              ],
            ),
          )
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
