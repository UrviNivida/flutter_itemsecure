import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_itemsecure_dsr/adapters/expenselist_layout.dart';
import 'package:flutter_itemsecure_dsr/app_screens/navigation_drawer.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:intl/intl.dart';

import 'NavigationBloc.dart';
import 'SideBar.dart';
import 'addexpense_screen.dart';

TextEditingController startdatecon = new TextEditingController();
TextEditingController enddatecon = new TextEditingController();
final format = DateFormat("yyyy-MM-dd");
//  final format = TimeOfDayFormat("yyyy-MM-dd");
String startformat = '', starttimeformat = '';
DateTime selectedDate = DateTime.now();
TimeOfDay selectedTime;

class ExpenseListScreen extends StatefulWidget {
  @override
  ExpenseListScreenState createState() => ExpenseListScreenState();
}

class ExpenseListScreenState extends State<ExpenseListScreen> {
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
      color: Colors.black);

  String otpText = "";
  TextEditingController otpcon = new TextEditingController();
  var _otpKey = GlobalKey<FormState>();

  TextStyle headStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);

  TextStyle titleStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);

  TextStyle valueStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.grey);

  final List<ScheduleModel> scheduleing = Schedulelist.getschedule();

  @override
  void initState() {
    // store();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          'Expenses',
          style: headStyle,
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: new Icon(Icons.add),
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return AddExpenseScreen();
                    }));},
              ),
              IconButton(
                icon: new Icon(Icons.filter_list),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((BuildContext context) {
                        return DynamicDialog();
                      }));
                },
              )
            ],
          ),
        ],
      ),
      drawer: new NavigationDrawerScreen(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: Stack(
            children: <Widget>[
              expenseListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget expenseListWidget() {
    return new Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('Claimed', textAlign: TextAlign.left, style: titleStyle),
                ),
                Expanded(
                  flex: 1,
                  child: Text('₹ ' + '380.0', textAlign: TextAlign.right, style: valueStyle),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('Approved', textAlign: TextAlign.left, style: titleStyle),
                ),
                Expanded(
                  flex: 1,
                  child: Text('₹ ' + '0.0', textAlign: TextAlign.right, style: valueStyle),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('Disbursed',
                      textAlign: TextAlign.left, style: titleStyle),
                ),
                Expanded(
                  flex: 1,
                  child: Text('₹ ' + '0.0',
                      textAlign: TextAlign.right, style: valueStyle),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text('Date Range',
                      textAlign: TextAlign.left, style: titleStyle),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Current Month',
                      textAlign: TextAlign.right, style: valueStyle),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            new Expanded(
              child: _buildExpenseList(),
            )
          ],
        ));
  }

  Widget _buildExpenseList() {
    return Container(
//      width: MediaQuery.of(context).size.width,
      child: scheduleing.length > 0
          ? ListView.builder(
              itemCount: scheduleing.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      scheduleing.removeAt(index);
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
                  child: ExpenseListLayout(scheduleModel: scheduleing[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('No Items')),
    );
  }

  List<DropdownMenuItem<FilterCategory>> buildDropdownMenuItems(
      List companies) {
    List<DropdownMenuItem<FilterCategory>> items = List();
    for (FilterCategory company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

}

class FilterCategory {
  int id;
  String name;

  FilterCategory(this.id, this.name);

  static List<FilterCategory> getroles() {
    return <FilterCategory>[
      FilterCategory(0, 'Select Role'),
      FilterCategory(4, 'Faculty'),
      FilterCategory(5, 'Student'),
    ];
  }
}

class DynamicDialog extends StatefulWidget {
//  DynamicDialog({this.title});

//  final String title;

  @override
  _DynamicDialogState createState() => _DynamicDialogState();
}

class _DynamicDialogState extends State<DynamicDialog> {
  String _title;

  final List<String> _dropdownValues = [
    "All",
    "Pending Approval by Manager",
    "Pending Approval by Accounts",
    "Approved",
    "Rejected by Manager",
    "Rejected by Accounts",
    "Disbursed",
  ];

  @override
  void initState() {
//    _title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle hintStyleDropdown = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w200,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

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
        color: Colors.black);

    final format1 = DateFormat("dd-MM-yyyy");
    final timeFormat = DateFormat("h:mm a");
    DateTime date;
    TimeOfDay time;

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(15),
      )),
      title: Text(
        "Choose Filter",
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
//          Text(
//            "Choose Filter",
//            style: TextStyle(fontWeight: FontWeight.bold),
//            textScaleFactor: 1.2,
//          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    'From:',
                    style: hintStyleDropdown,
                    textAlign: TextAlign.right,
                  ),
                ),
                Expanded(
                  flex: 2,
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
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    'To:',
                    style: hintStyleDropdown,
                    textAlign: TextAlign.right,
                  ),
                ),
                Expanded(
                  flex: 2,
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
                    controller: enddatecon,
//                            validator: (String value) {
//                              if (value.isEmpty) {
//                                return 'Please Select Start Date';
//                              }
//                            },
                    decoration: InputDecoration(
                      border: InputBorder.none,
//                                    labelStyle: labelStyle,
                      hintText: 'To Date',
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
          ),
          SizedBox(
            height: 0,
          ),
          DropdownButton(
            items: _dropdownValues
                .map((value) => DropdownMenuItem(
                      child: Text(value,style: textStyle,),
                      value: value,
                    ))
                .toList(),
            onChanged: (String value) {
              setState(() {
                _title = value;
              });
            },
            value: _title,
            isExpanded: true,
            hint: Text('Select Status',style: hintStyle,),
          ),
        ],
      ),

//      DropdownButton(
//        items: _dropdownValues
//            .map((value) => DropdownMenuItem(
//          child: Text(value),
//          value: value,
//        )).toList(),
//        onChanged: (String value) {
//          setState(() {
//            _title = value;
//          });
//        },
//        value: _title,
//        isExpanded: false,
//        hint: Text('Select Number'),
//      ),

      actions: <Widget>[
        GestureDetector(
    onTap: ()=> Navigator.pop(context),
          child: new Card(
              elevation: 5.0,
              color: Colors.black,
//          onPressed: null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              )),
              child: Padding(
                child: Text('Filter',
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
    );
  }
}
