import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:xlive_switch/xlive_switch.dart';

import 'NavigationBloc.dart';

class SideBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SideBarState();
  }
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

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

  TextStyle textStylePunch = TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Quicksand',
      color: Colors.black);

  TextStyle navStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Quicksand',
      color: Colors.black);

  String punchstring="";

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  bool _value = true;
  @override
  Widget build(BuildContext context) {

    TextStyle headStyleYellow = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

    print(_value);
    void _changeValue(bool value) {
      setState(() {
        _value = value;
        if (_value == true) {
          print("renturn 11");
          return null;
        } else {
          print("renturn 22");
          return showDialog(
                context: context,
                builder: (context) => new AlertDialog(
                  title: new Text('Item Secure',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                      )),
                  content: new Text(
                    'Are you sure you want to PunchOut?',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text('No'),
                      textColor: Colors.grey,
                    ),
                    new FlatButton(
/*          Navigator.of(context).pop(true)*/
                      onPressed: () {
                        setState(() {
                          _value == false;
                          Navigator.of(context).pop(true);
                        });
                      },
                      child: new Text('Yes'),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ) ??
              false;
        }
      });
    }

    final screenWidth = MediaQuery.of(context).size.width;
    var _padding = 8.0;

    Widget getinout() {



      if (_value == true) {
        return StreamBuilder<bool>(
          initialData: false,
          stream: isSidebarOpenedStream,
          builder: (context, isSideBarOpenedAsync) {
            return AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
              right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Khushali Thakkar",
                              style: headStyle,
                            ),
                            subtitle: Text(
                              "Android Developer",
                              style: textStyle,
                            ),
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.perm_identity,
                                color: Colors.white,
                              ),
                              radius: 30,
                            ),
                          ),
                          Divider(
                            height: 5,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    'Punched in : 23rd May 2014, 9:00 am',
                                    style: textStylePunch,
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
                          Divider(
                            height: 5,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.card_travel,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Visit",
                              style: navStyle,
                            ),
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.MyAccountClickedEvent);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Message",
                              style: navStyle,
                            ),
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.MyAccountClickedEvent);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.attach_money,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Expenses",
                              style: navStyle,
                            ),
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.MyAccountClickedEvent);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.help_outline,
                              color: Colors.black,

                            ),
                            title: Text(
                              "Tips",
                              style: navStyle,
                            ),
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.MyAccountClickedEvent);
                            },
                          ),
                          Divider(
                            height: 5,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.power_settings_new,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Logout",
                              style: navStyle,
                            ),
                            onTap: () {
                              //onIconPressed();
                              return showDialog(
                                    context: context,
                                    builder: (context) => new AlertDialog(
                                      title: new Text(
                                        'Logout',
                                        style:
                                            headStyle,
                                      ),
                                      content:
                                          new Text('Are you sure to logout?',style: textStyle,),
                                      actions: <Widget>[
                                        new FlatButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: new Text('No'),
                                          textColor: Colors.grey,
                                        ),
                                        new FlatButton(
/*          Navigator.of(context).pop(true)*/
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: new Text('Yes'),
                                          textColor: Theme.of(context).primaryColor,
                                        ),
                                      ],
                                    ),
                                  ) ??
                                  false;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.9),
                    child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },
                      child: ClipPath(
                        clipper: CustomMenuClipper(),
                        child: Container(
                          width: 35,
                          height: 100,
                          color: Theme.of(context).primaryColor,
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                            progress: _animationController.view,
                            icon: AnimatedIcons.menu_close,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      } else {
        return StreamBuilder<bool>(
          initialData: false,
          stream: isSidebarOpenedStream,
          builder: (context, isSideBarOpenedAsync) {
            return AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
              right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: const Color(0xFFF8C300),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "Khushali Thakkar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              "Android Developer",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.perm_identity,
                                color: Colors.white,
                              ),
                              radius: 30,
                            ),
                          ),
                          Divider(
                            height: 5,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Not Punchout',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
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
                          Divider(
                            height: 5,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Visit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.MyAccountClickedEvent);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Message",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.MyAccountClickedEvent);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Expenses",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.MyAccountClickedEvent);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Tips",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationEvents.MyAccountClickedEvent);
                            },
                          ),
                          Divider(
                            height: 5,
                            thickness: 0.5,
                            color: Colors.white.withOpacity(0.5),
//                        indent: 10,
//                        endIndent: 10,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.power_settings_new,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            onTap: () {
                              //onIconPressed();
                              return showDialog(
                                    context: context,
                                    builder: (context) => new AlertDialog(
                                      title: new Text(
                                        'Logout',
                                        style:
                                            TextStyle(color: Color(0xFFF8C300)),
                                      ),
                                      content:
                                          new Text('Are you sure to logout?'),
                                      actions: <Widget>[
                                        new FlatButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: new Text('No'),
                                          textColor: Colors.grey,
                                        ),
                                        new FlatButton(
/*          Navigator.of(context).pop(true)*/
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: new Text('Yes'),
                                          textColor: Color(0xFFF8C300),
                                        ),
                                      ],
                                    ),
                                  ) ??
                                  false;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.9),
                    child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },
                      child: ClipPath(
                        clipper: CustomMenuClipper(),
                        child: Container(
                          width: 35,
                          height: 100,
                          color: Color(0xFFF8C300),
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                            progress: _animationController.view,
                            icon: AnimatedIcons.menu_close,
                            color: Color(0xFF1BB5FD),
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    }

    return getinout();
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
