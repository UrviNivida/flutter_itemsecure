import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;

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

  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

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

    TextStyle hintStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w200,
      fontFamily: 'Quicksand',
    );

    TextStyle textStyleTitleWhite = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Colors.white);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
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
            icon: Icon(Icons.build),
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
          Padding(
            padding: EdgeInsets.all(_padding),
            child: CupertinoTabBar.CupertinoTabBar(
              const Color(0xFFd4d7dd),
              const Color(0xFFf7f7f7),
              [
                Text(
                  "Activity",
                  style: headStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Contact",
                  style: headStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Notes",
                  style: headStyle,
                  textAlign: TextAlign.center,
                ),
              ],
              cupertinoTabBarValueGetter,
              (int index) {
                setState(() {
                  cupertinoTabBarValue = index;
                });
              },
              horizontalPadding: 10,
            ),
          ),
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
                      )


                      ,
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: _padding),
                              child:  Container(

                              ),
                            )
                            ,
                            Container(
                                child: IconTheme(
                                  data: new IconThemeData(color: Colors.grey),
                                  child: new Icon(Icons.location_on),
                                )
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
                        height:_imageheight,
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
                      )


                      ,
                    )),
                Expanded(
                    flex: 4,
                    child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: _padding),
                              child:  Container(
                                  child: IconTheme(
                                    data: new IconThemeData(color: Colors.grey),
                                    child: new Icon(Icons.chat_bubble),
                                  )
                              ),
                            )
                           ,
                            Container(
                                child: IconTheme(
                                  data: new IconThemeData(color: Colors.grey),
                                  child: new Icon(Icons.call),
                                )
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
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            child: IconTheme(
                              data: new IconThemeData(color: Colors.white,),
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
                              child:  Container(

                              ),
                            )
                            ,
                            Container(
                                child: IconTheme(
                                  data: new IconThemeData(color: Colors.grey),
                                  child: new Icon(Icons.call),
                                )
                            )
                          ],
                        ))),
              ],
            ),
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
