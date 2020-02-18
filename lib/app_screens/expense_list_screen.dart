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

TextEditingController startdatecon = new TextEditingController();
TextEditingController starttimecon = new TextEditingController();
final format = DateFormat("yyyy-MM-dd");
//  final format = TimeOfDayFormat("yyyy-MM-dd");
String startformat = '',starttimeformat='';
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

  var _currentItemSelected;
  var _currencies=[] ;



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
                onPressed: () {},
              ),
              IconButton(
                icon: new Icon(Icons.filter_list),
                onPressed: () {
                  customFilterPopup();
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
                  child: Text('Claimed',
                      textAlign: TextAlign.left, style: titleStyle),
                ),
                Expanded(
                  flex: 1,
                  child: Text('₹ ' + '380.0',
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
                  child: Text('Approved',
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


  Widget customFilterPopup()
  {

//    var _currentItemSelected;
    _currencies = ['All', 'Pending approval by manager','Pending Approval by accounts',
    'Approved','Rejected by manager','Rejected by accounts','Disbursed'];
    
    TextStyle hintStyleDropdown = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w200,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);
    
    return EasyDialog(
        key: _otpKey,
        cardColor: Colors.white,
        closeButton: false,
        cornerRadius: 10.0,
//        fogOpacity: 0.1,
        width: 300,
        height: 234,
        title: Text(
          "Choose Filter",
          style: TextStyle(fontWeight: FontWeight.bold),
          textScaleFactor: 1.2,
        ),
//        descriptionPadding: EdgeInsets.only(left: 17.5, right: 17.5, bottom: 15.0),
//        description: Text(
//          "This is a custom dialog. Easy Dialog helps you easily create basic or custom dialogs.",
//          textScaleFactor: 1.1,
//          textAlign: TextAlign.center,
//        ),
//        topImage: NetworkImage(
//            "https://raw.githubusercontent.com/ricardonior29/easy_dialog/master/example/assets/topImageblack.png"),
        contentPadding: EdgeInsets.only(top: 12.0),
        // Needed for the button design
        contentList: [
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'From:',
                        style: hintStyleDropdown,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        child: AbsorbPointer(
                            child: Container(
                              alignment: Alignment.center,
                              child: TextFormField(
                                textAlign: TextAlign.center,
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
                                  hintText: 'From Date',
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
                    Expanded(
                      flex: 1,
                      child: Text(
                        'To:',
                        style: hintStyleDropdown,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        child: AbsorbPointer(
                            child: Container(
                              alignment: Alignment.center,
                              child: TextFormField(
                                textAlign: TextAlign.center,
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
                                  hintText: 'To Date',
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 10),
                child: Container(
                  alignment: Alignment.center,
//                       width: 220.0,
                  child: DropdownButtonFormField<String>(
                    style: textStyle,
                    decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.all(_contentPadding),
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Filter By',
                        labelStyle: hintStyleDropdown,
//                                    prefixIcon: Icon(Icons.apps),
                        border: UnderlineInputBorder(
//                                      borderRadius: BorderRadius.circular(_borderradius),
                        )),
                    isExpanded: false,
                    items: _currencies.map((var dropdownstringitem) {
                      return DropdownMenuItem<String>(
                        value: dropdownstringitem,
                        child: Text(
                          dropdownstringitem,
                          style: textStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (String newvalueuser) {
                      setState(() {
                        _onDropDownItemSelected(newvalueuser);
                        print(_currentItemSelected);
                      });
                    },
                    value: _currentItemSelected,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(0.0))),
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Filter",
                          style: labelStyle,
//                          textScaleFactor: 1.3,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight:
                              Radius.circular(10.0))),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: labelStyle,
//                          textScaleFactor: 1.3,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ]).show(context);
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
}

