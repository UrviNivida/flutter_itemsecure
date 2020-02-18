import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'expense_list_screen.dart';

class OutcomeScreen extends StatefulWidget {
  @override
  _OutcomeScreenState createState() => _OutcomeScreenState();
}

class _OutcomeScreenState extends State<OutcomeScreen> {
  var _padding = 12.0;
  bool _value = true;
  var _imageheight = 40.0;
  var _imagewidth = 40.0;
  var _imagewidthSub = 28.0;
  var _imageheightSub = 28.0;
  var _circlePadding = 8.0;

  @override
  Widget build(BuildContext contextt) {
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

    TextEditingController startdatecon = new TextEditingController();
    TextEditingController starttimecon = new TextEditingController();
    TextEditingController endtimecon = new TextEditingController();

    final format = DateFormat("yyyy-MM-dd");
//  final format = TimeOfDayFormat("yyyy-MM-dd");
    String startformat = '',starttimeformat='';
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime;



    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.cancel,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Report Outcome',
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
              Icons.check_circle,
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
                    'How did the Appointment go?',
                    style: textStyleBlue,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_padding),
            child: Row(
              children: <Widget>[
                GestureDetector(
                    child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      child: Image(
                        image: AssetImage('images/smile_fill.png'),
                        width: _imagewidth,
                        height: _imageheight,
                        color: Colors.green,
                      ),
                    ),
//                    Container(
//                        child: Image(
//                          image: AssetImage('images/smile_b.png'),
//                          width: _imagewidth,
//                          height: _imageheight,
//                          color: Theme.of(context).primaryColor,
//                        ))
                  ],
                )),
                GestureDetector(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              child: Image(
                                image: AssetImage('images/sad_fill.png'),
                                width: _imagewidth,
                                height: _imageheight,
                                color: Colors.grey,
                              ),
                            ),
//                            Container(
//                                child: Image(
//                                  image: AssetImage('images/sad_fill.png'),
//                                  width: _imagewidth,
//                                  height: _imageheight,
//                                  color: Theme.of(context).primaryColor,
//                                ))
                          ],
                        ))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    'Whats the next action?',
                    style: textStyleBlue,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_padding),
            child: Row(
              children: <Widget>[
                GestureDetector(
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
                      ),
                    )
                  ],
                )),
                GestureDetector(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              child: Image(
                                  image: AssetImage('images/yellowcircle.png'),
                                  width: _imagewidth,
                                  height: _imageheight,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Container(
                                child: IconTheme(
                              data: new IconThemeData(
                                color: Colors.white,
                              ),
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
                    flex: 2,
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(_circlePadding),
                        child: Text(
                          'When?',
                          style: textStyleBlue,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child:  GestureDetector(
                      child: AbsorbPointer(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextFormField(
                              autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                              keyboardType: TextInputType.datetime,
//                                maxLength: 10,
                              style: textStyle,
                              controller: startdatecon,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Select Start Date';
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
//                                    labelStyle: labelStyle,
                                hintText: 'Start Date',
                                hintStyle: hintStyle,
//                                    labelText: 'Agency Name'
//                                    contentPadding: const EdgeInsets.only(bottom: -10.0)

//                            filled: true,
                              ),
                            ),
                          )),
                      onTap: () {
                        _selectDate(context);
                      },
                    )),
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                      child: AbsorbPointer(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextFormField(
                              autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                              keyboardType: TextInputType.datetime,
//                                maxLength: 10,
                              style: textStyle,
                              controller: starttimecon,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Select Start Time';
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
//                                    labelStyle: labelStyle,
                                hintText: 'Start Time',
                                hintStyle: hintStyle,
//                                    labelText: 'Agency Name'
//                                    contentPadding: const EdgeInsets.only(bottom: -10.0)

//                            filled: true,
                              ),
                            ),
                          )),
                      onTap: () {
                        _selectTime(context);
                      },
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: IconTheme(
                            data: new IconThemeData(
                              color: Colors.grey,
                            ),
                            child: new Icon(Icons.arrow_forward_ios),
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
                    flex: 2,
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(_circlePadding),
                        child: Text(
                          'To?',
                          style: textStyleBlue,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(_circlePadding),
                        child: Text(''
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(_circlePadding),
                        child: Text(
                          '1:00 pm',
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
                            Container(
                              child: IconTheme(
                                data: new IconThemeData(
                                  color: Colors.grey,
                                ),
                                child: new Icon(Icons.arrow_forward_ios),
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
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle: hintStyle,
                                  labelStyle: textStyle,
                                  border: InputBorder.none,
                                  hintText: 'Subject'),
                            ),
                          ),
                        ],
                      )),
                ),
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
                        child: TextField(
                          decoration: InputDecoration(
                              hintStyle: hintStyle,
                              labelStyle: textStyle,
                              border: InputBorder.none,
                              hintText: 'Description'),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );


  }




  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime pickeddate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (pickeddate != null && pickeddate != selectedDate)
      setState(() {
        selectedDate = pickeddate;
        var formatter = new DateFormat('dd-MM-yyyy');
        startformat = formatter.format(pickeddate);
        //  var formatter4 = new DateFormat('yyyy-MM-dd');
        // formattedday = formatter4.format(picked);
        //  print(formattedday); // // something like 2
        startdatecon.value = TextEditingValue(text: startformat);
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay pickedtime = await showTimePicker(
      context: context,
      initialTime: selectedTime,

    );
//    if (pickedtime != null && pickedtime != selectedTime)
////      selectTime(picked);
//    setState(() {
//      selectedTime = pickedtime;
//      var formatter = new DateFormat('dd-MM-yyyy');
////      startformat = formatter.format(pickeddate);
//      starttimeformat=selectedTime.format(context);
//      //  var formatter4 = new DateFormat('yyyy-MM-dd');
//      // formattedday = formatter4.format(picked);
//      //  print(formattedday); // // something like 2
//      starttimecon.value = TextEditingValue(text: starttimeformat);
//    });
  }

  void _changeValue(bool value) {
    setState(() {
      _value = value;
    });
  }



}
