import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/app_screens/chat_screen.dart';

import 'add_message_screen.dart';
import 'package:intl/intl.dart';

import 'navigation_drawer.dart';


class message_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return message_screenState();
  }
}

class message_screenState extends State<message_screen> {
  TextStyle headStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);
  TextStyle textStyleTitle = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black87);
  TextStyle textStyleTitlegray = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.grey[600]);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 3.0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Text("Message", style: headStyle),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return add_message_screen();
                    }));
                  },
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
        drawer: new NavigationDrawerScreen(),
        body: Container(
          height: 80,
          child: Card(
            child: Row(children: <Widget>[
              Expanded(
                flex: 7,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
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
                      child: ListTile(
                        title: Text(
                          "Khushali Thakkar",
                          style: textStyleTitle,
                        ),
                        subtitle: Text(
                          "Hello How r u ?",
                          style: textStyleTitlegray,
                        ),
                        trailing: Text("20 Feb 2020"),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
