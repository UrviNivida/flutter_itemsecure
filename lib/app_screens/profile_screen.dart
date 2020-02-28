//import 'dart:io';
//
//import 'package:flutter/material.dart';
//import 'package:flutter_itemsecure_dsr/utils/ImagePickerHandler.dart';
//
//
//class HomeScreen extends StatefulWidget {
////  HomeScreen({Key key, this.title}) : super(key: key);
////  final String title;
//
//  @override
//  _HomeScreenState createState() => new _HomeScreenState();
//}
//
//class _HomeScreenState extends State<HomeScreen>
//    with TickerProviderStateMixin,ImagePickerListener{
//
//  File _image;
//  AnimationController _controller;
//  ImagePickerHandler imagePicker;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = new AnimationController(
//      vsync: this,
//      duration: const Duration(milliseconds: 500),
//    );
//
//    imagePicker=new ImagePickerHandler(this,_controller);
//    imagePicker.init();
//
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('hhhh',
//          style: new TextStyle(
//              color: Colors.white
//          ),
//        ),
//      ),
//      body: new GestureDetector(
//        onTap: () => imagePicker.showDialog(context),
//        child: new Center(
//          child: _image == null
//              ? new Stack(
//            children: <Widget>[
//
//              new Center(
//                child: new CircleAvatar(
//                  radius: 80.0,
//                  backgroundColor: const Color(0xFF778899),
//                ),
//              ),
//              new Center(
//                child: new Image.asset("assets/photo_camera.png"),
//              ),
//
//            ],
//          )
//              : new Container(
//            height: 160.0,
//            width: 160.0,
//            decoration: new BoxDecoration(
//              color: const Color(0xff7c94b6),
//              image: new DecorationImage(
//                image: new ExactAssetImage(_image.path),
//                fit: BoxFit.cover,
//              ),
//              border:
//              Border.all(color: Colors.red, width: 5.0),
//              borderRadius:
//              new BorderRadius.all(const Radius.circular(80.0)),
//            ),
//          ),
//        ),
//      ),
//
//    );
//  }
//
//  @override
//  userImage(File _image) {
//    setState(() {
//      this._image = _image;
//    });
//  }
//
//}


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/utils/ImagePickerHandler.dart';

import 'dashboard_screen.dart';


class profile_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return profile_screenState();
  }
}

class profile_screenState extends State<profile_screen>
    with TickerProviderStateMixin, ImagePickerListener {
  File _image;
  AnimationController _controller;
  ImagePickerHandler imagePicker;
  TextStyle headStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    imagePicker = new ImagePickerHandler(this, _controller);
    imagePicker.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);
    TextStyle textStylevalue = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Quicksand',
        color: Colors.black);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Your Profile",
            style: headStyle,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                  onTap: () => imagePicker.showDialog(context),
                  child: new Container(
                    height: 120,
                      child: Center(
                    child: _image == null
                        ? new Stack(
                      children: <Widget>[
                        Center(
                          child: CircleAvatar(
                            child: Container(
                              height: 120,
                              width: 120,
                              alignment: Alignment.center,
                              child: Icon(Icons.account_circle,color: Colors.grey,size: 40,),
                            ),
                            radius: 80.0,
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 120,
                            width: 120,
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.add_a_photo,color: Colors.black,size: 32,),
                          ),
                        )


                      ],
                    )
                        : new Container(
                      height: 120.0,
                      width: 120.0,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: new BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: new DecorationImage(
                                image: new ExactAssetImage(_image.path),
                                fit: BoxFit.cover,
                              ),
                              border:
                              Border.all(color: Colors.black54, width: 5.0),
                              borderRadius:
                              new BorderRadius.all(const Radius.circular(80.0)),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 120,
                              width: 120,
                              alignment: Alignment.bottomRight,
                              child: Icon(Icons.add_a_photo,color: Colors.black,size: 32,),
                            ),
                          )
                        ],
                      ),

                    ),
                  ))),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: new EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('First Name', style: textStyle),
                            )),
                        Expanded(
                          flex: 5,
                          child: Container(
                              child: Text("Khushali", style: textStylevalue)),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Last Name', style: textStyle),
                            )),
                        Expanded(
                          flex: 5,
                          child: Container(
                              child: Text("Thakkar", style: textStylevalue)),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Designation', style: textStyle),
                            )),
                        Expanded(
                            flex: 6,
                            child: Container(
                                child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text("Android", style: textStylevalue),
                                ],
                              ),
                              subtitle:
                                  Text("Developer", style: textStylevalue),
                            ))),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Role', style: textStyle),
                            )),
                        Expanded(
                          flex: 5,
                          child: Container(
                              child: Text("Admin", style: textStylevalue)),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Email Id', style: textStyle),
                            )),
                        Expanded(
                            flex: 5,
                            child: Container(
                              child: Text("k@gmail.com", style: textStylevalue),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Contact', style: textStyle),
                            )),
                        Expanded(
                            flex: 5,
                            child: Container(
                              child: Text("1234567890", style: textStylevalue),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                colors: [
                                  Theme.of(context).primaryColor,
                            Theme.of(context).primaryColor])),
                        child: Center(
                          child: Text("Logout", style: headStyle),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return DashbaroadScreen();
                          }));
                        },
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}
