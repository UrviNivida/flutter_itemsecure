//
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
//import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
//import 'package:flutter_typeahead/flutter_typeahead.dart';
//
//class FormExample extends StatefulWidget {
//  @override
//  _FormExampleState createState() => _FormExampleState();
//}
//
//class _FormExampleState extends State<FormExample> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  final TextEditingController _typeAheadController = TextEditingController();
//
//  String _selectedCity;
//  static List<ScheduleModel> schedulesearchname=Schedulelist.getschedule();
//
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      child:  Form(
//        key: this._formKey,
//        child: Padding(
//          padding: EdgeInsets.all(0.0),
//          child: Column(
//            children: <Widget>[
//              Text('What is your favorite city?'),
//              TypeAheadFormField(
//                textFieldConfiguration: TextFieldConfiguration(
//                  decoration: InputDecoration(labelText: 'City'),
//                  controller: this._typeAheadController,
//                ),
//                suggestionsCallback: (pattern) {
//                  return getSuggestions(pattern);
////                return CitiesService.getSuggestions(pattern);
//                },
//                itemBuilder: (context, suggestion) {
//                  return ListTile(
//                    title: Text(suggestion),
//                  );
//                },
//                transitionBuilder: (context, suggestionsBox, controller) {
//                  return suggestionsBox;
//                },
//                onSuggestionSelected: (suggestion) {
//                  this._typeAheadController.text = suggestion;
//                },
//                validator: (value) {
//                  if (value.isEmpty) {
//                    return 'Please select a city';
//                  }
//                },
//                onSaved: (value) => this._selectedCity = value,
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              RaisedButton(
//                child: Text('Submit'),
//                onPressed: () {
//                  if (this._formKey.currentState.validate()) {
//                    this._formKey.currentState.save();
//                    Scaffold.of(context).showSnackBar(SnackBar(
//                        content:
//                        Text('Your Favorite City is ${this._selectedCity}')));
//                  }
//                },
//              )
//            ],
//          ),
//        ),
//      )
//    );
//  }
//
//
//  static List<String> getSuggestions(String query) {
//    List<String> matches = List();
//    for(var i = 0; i < schedulesearchname.length; i++){
//      matches.add(schedulesearchname[i].name);
//    }
//    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
//    return matches;
//  }
//}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// For changing the language

class AddVisitScreen extends StatefulWidget {
  @override
  AddVisitScreenState createState() => AddVisitScreenState();
}

class AddVisitScreenState extends State<AddVisitScreen> {
  var _paddingbottom = 1.0;
  var _paddingtop = 15.0;
  var _formKey = GlobalKey<FormState>();
  var displayResult = '';
  var _fieldPadding = 25.0;
  var _sizebox = 15.0;

  TextEditingController agencycon = new TextEditingController();
  TextEditingController subjectcon = new TextEditingController();
  TextEditingController descriptioncon = new TextEditingController();
  TextEditingController startdatecon = new TextEditingController();
  TextEditingController starttimecon = new TextEditingController();
  TextEditingController endtimecon = new TextEditingController();

  List<String> _checked = ["A", "B"];
  String _picked = "Customer";

  var _currentItemSelected;
  var _currencies = ['New', 'Existing'];

  static List<ScheduleModel> scheduleing = Schedulelist.getschedule();
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedName;

  final format = DateFormat("yyyy-MM-dd");

//  final format = TimeOfDayFormat("yyyy-MM-dd");
  String startformat = '', starttimeformat = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime;

//  final ValueChanged<TimeOfDay> selectTime;

  final format1 = DateFormat("dd-MM-yyyy");
  final timeFormat = DateFormat("h:mm a");
  DateTime date;
  TimeOfDay time;

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

    TextStyle hintStyleDropdown = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w200,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

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
                    'Add Visit',
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
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Container(
//               height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.all(_fieldPadding),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        style: textStyle,
                        decoration: InputDecoration(
                            labelText: 'Customer',
                            labelStyle: hintStyleDropdown,
                            hintText: 'Select Customer Name'),
                        controller: this._typeAheadController,
                      ),
                      suggestionsCallback: (pattern) {
                        return getSuggestions(pattern);
//                return CitiesService.getSuggestions(pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        return ListTile(
                          title: Text(
                            suggestion,
                            style: textStyle,
                          ),
                        );
                      },
                      transitionBuilder: (context, suggestionsBox, controller) {
                        return suggestionsBox;
                      },
                      onSuggestionSelected: (suggestion) {
                        this._typeAheadController.text = suggestion;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please select a city';
                        }
                      },
                      onSaved: (value) => this._selectedName = value,
                    )),
                SizedBox(
                  height: _sizebox,
                ),
                Container(
                  alignment: Alignment.center,
//                       width: 220.0,
                  child: DropdownButtonFormField<String>(
                    style: textStyle,
                    decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.all(_contentPadding),
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Category Type',
                        labelStyle: hintStyleDropdown,
//                                    prefixIcon: Icon(Icons.apps),
                        border: UnderlineInputBorder(
//                                      borderRadius: BorderRadius.circular(_borderradius),
                            )),
                    isExpanded: false,
                    items: _currencies.map((String dropdownstringitem) {
                      return DropdownMenuItem<String>(
                        value: dropdownstringitem,
                        child: Text(
                          dropdownstringitem,
                          style: textStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (String newvalueuser) {
                      _onDropDownItemSelected(newvalueuser);

//                setState(() {
//                  this._currentItemSelected = newvalueuser;
//                });
                    },
                    value: _currentItemSelected,
                  ),
                ),
                SizedBox(
                  height: _sizebox,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Starts',
                        style: labelStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: DateTimeField(
                        textAlign: TextAlign.center,
                        format: format1,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                        resetIcon: null,
                        autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                        keyboardType: TextInputType.datetime,
//                                maxLength: 10,
                        style: textStyle,
                        controller: startdatecon,
//                            validator: (String value) {
//                              if (value.isEmpty) {
//                                return 'Please Select Start Date';
//                              }
//                            },
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

//                      GestureDetector(
//                        child: AbsorbPointer(
//                            child: Container(
//                          alignment: Alignment.center,
//                          child: DateTimeField(
//                            onShowPicker: (context, currentValue) {
//                              return showDatePicker(
//                                  context: context,
//                                  firstDate: DateTime(1900),
//                                  initialDate: currentValue ?? DateTime.now(),
//                                  lastDate: DateTime(2100));
//                            },
//
//                            format: format1,
//                            autofocus: false,
////                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
//                            keyboardType: TextInputType.datetime,
////                                maxLength: 10,
//                            style: textStyle,
//                            controller: startdatecon,
////                            validator: (String value) {
////                              if (value.isEmpty) {
////                                return 'Please Select Start Date';
////                              }
////                            },
//                            decoration: InputDecoration(
//                              border: InputBorder.none,
////                                    labelStyle: labelStyle,
//                              hintText: 'Start Date',
//                              hintStyle: hintStyle,
////                                    labelText: 'Agency Name'
////                                    contentPadding: const EdgeInsets.only(bottom: -10.0)
//
////                            filled: true,
//                            ),
//                          ),
//                        )),
//                        onTap: () {
//                          _selectDate(context);
//                        },
//                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: DateTimeField(
                        textAlign: TextAlign.center,
                        resetIcon: null,
                        format: timeFormat,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.convert(time);
                        },
                        autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                        keyboardType: TextInputType.datetime,
//                                maxLength: 10,
                        style: textStyle,
                        controller: starttimecon,
//                                validator: (String value) {
//                                  if (value.isEmpty) {
//                                    return 'Please Select Start Time';
//                                  }
//                                },
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
                      ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Ends',
                        style: labelStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(''),
                    ),
                    Expanded(
                      flex: 1,
                      child: DateTimeField(
                        textAlign: TextAlign.center,
                        resetIcon: null,
                        format: timeFormat,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.convert(time);
                        },
                        autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                        keyboardType: TextInputType.datetime,
//                                maxLength: 10,
                        style: textStyle,
                        controller: endtimecon,
//                                validator: (String value) {
//                                  if (value.isEmpty) {
//                                    return 'Please Select Start Time';
//                                  }
//                                },
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

//                        TextFormField(
//                          autofocus: false,
////                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
//                          keyboardType: TextInputType.text,
////                                maxLength: 10,
//                          style: textStyle,
//                          controller: startdatecon,
//                          textAlign: TextAlign.center,
//                          validator: (String value) {
//                            if (value.isEmpty) {
//                              return 'Please Select Start Date';
//                            }
//                          },
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                              hintText: 'Start Date',
//                              hintStyle: hintStyle,
//                          ),
//                        ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextFormField(
                    autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                    keyboardType: TextInputType.text,
//                                maxLength: 10,
                    style: textStyle,
                    controller: subjectcon,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Subject';
                      }
                    },
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
                        hintText: 'Enter Subject',
                        hintStyle: hintStyle,
                        labelText: 'Subject'
//                                    contentPadding: const EdgeInsets.only(bottom: -10.0)

//                            filled: true,
                        ),
                  ),
                ),
                SizedBox(
                  height: _sizebox,
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextFormField(
                    autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                    keyboardType: TextInputType.text,
//                                maxLength: 10,
                    style: textStyle,
                    controller: descriptioncon,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Description';
                      }
                    },
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
          ))),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      FocusScope.of(context).requestFocus(new FocusNode());
      this._currentItemSelected = newValueSelected;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
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

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    for (var i = 0; i < scheduleing.length; i++) {
      matches.add(scheduleing[i].name);
    }
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("hh:mm a");

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
//
      Text(
        "Select Time",
      ),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  final format1 = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("Select Date"),
      DateTimeField(
        format: format1,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}
