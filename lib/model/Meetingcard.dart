import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';

import 'MeetingModel.dart';


class Meetingcard extends StatelessWidget {
  final MeetingModel meetingModel;
  var _imageheight = 30.0;
  var _imagewidth = 30.0;
  Meetingcard({this.meetingModel});
  TextStyle textStyleTitle = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black87);
  TextStyle textStyleTitle1 = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xFFF8C300));
  TextStyle textStyleTitle2 = TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black87);
  TextStyle hintStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w200,
    fontFamily: 'Quicksand',
  );
  TextStyle textStyleTitle7 = TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black87);
  TextStyle textStyleTitle5 = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: const Color(0xFFF8C300));
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        EasyDialog(
            cornerRadius: 2.0,
            fogOpacity: 0.1,
            width: 280,
            height: 280,
            contentPadding:
                EdgeInsets.only(top: 12.0), // Needed for the button design
            contentList: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text(
                      "Meeting To Discuss server issue",
                      style: textStyleTitle5,
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 9,
                  child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 0,
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 2.0, left: 5.0),
                                      width: 44.0,
                                      height: 44.0,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new NetworkImage(
                                                "https://cdn.pixabay.com/photo/2013/07/21/13/00/rose-165819_960_720.jpg"),
                                          ))),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ListTile(
                                    title: Text(
                                      "Reported " + meetingModel.name,
                                      style: textStyleTitle2,
                                    ),
                                    subtitle: Text(
                                      meetingModel.date + ", 11:34 PM",
                                      style: textStyleTitle2,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Server was inspected and all issue were resloved.There was a bit of issue with HQ email system,but it was a resloved on site.",
                                style: textStyleTitle7,
                              ),
                            )
                          ],
                        ),
                      ))),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(2.0),
                        bottomRight: Radius.circular(2.0))),
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Image(
                            image: AssetImage('images/smile_fill.png'),
                            width: _imagewidth,
                            height: _imageheight,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: Text(
                              "Follow Up action: Call",
                              style: textStyleTitle,
                            ),
                            subtitle: Text(
                              "On:" + meetingModel.date + ", 9:00 am",
                              style: hintStyle,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ]).show(context);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                meetingModel.title,
                style: textStyleTitle,
              ),
              subtitle: Text(
                meetingModel.name,
                style: textStyleTitle1,
              ),
              trailing: Text(meetingModel.date),
            )
          ],
        ),
      ),
    );
  }
}
