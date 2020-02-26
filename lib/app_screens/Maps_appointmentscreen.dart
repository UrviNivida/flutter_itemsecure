import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/adapters/Schdeulecard.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import 'NavigationBloc.dart';
import 'package:intl/intl.dart';

class Maps_appointmentscreen extends StatefulWidget with NavigationStates {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAccountsPagenew();
  }
}

class MyAccountsPagenew extends State<Maps_appointmentscreen> {
  var _padding = 12.0;
  bool _value = true;
  var _imageheight = 40.0;
  var _imagewidth = 40.0;

  TextStyle textStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);

  final List<ScheduleModel> scheduleing = Schedulelist.getschedule();
  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _mainLocation = const LatLng(22.317498, 73.164598);

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_mainLocation.toString()),
        position: _mainLocation,
        infoWindow: InfoWindow(
          title: 'Nivida Web Solutions Pvt. Ltd.',
          snippet:
              '305, Privilege Avenue, Opp. isha hospital, Behind atlantis Sarabhai campus, Sarabhai Rd, Vadiwadi, Vadodara, Gujarat 390023',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    return _markers;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
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
                            color: Theme.of(context).primaryColor,
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
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((BuildContext context) {
                              return DynamicDialog();
                            }));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 8, child: _tabSection(context)),
//              Expanded(flex: 1,child: )
        ],
      ),
      bottomSheet: SolidBottomSheet(
        maxHeight: 400,
        headerBar: Container(
          color: Colors.grey[300],
          height: 50,
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '5 Scheduled meetings',
                      style: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Icon(Icons.refresh),
                  ),
                )
              ],
            ),

//            Text("5 Scheduled meetings",style: textStyle,),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: _buildAppointmentList(),
        ),
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
    return Container(
//      height: 520,
      height: MediaQuery.of(context).size.height / 1.28,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _mainLocation,
              zoom: 10.0,
            ),
            markers: this.myMarker(),
            mapType: MapType.normal,
            onMapCreated: (controller) {
              setState(() {
                myMapController = controller;
              });
            },
          ),
//          Align(
//            alignment: Alignment.bottomLeft,
//            child: Padding(
//              padding: EdgeInsets.all(_padding),
//              child: Container(
//                  color: Colors.white,
////                                  margin: const EdgeInsets.only(
////                                      left: 10.0, right: 10.0),
//                  child: new Padding(
//                    padding: const EdgeInsets.all(10.0),
//                    child: new Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Expanded(
//                            flex: 1,
//                            child: Container(
//                                child: GestureDetector(
//                                  onTap: () {
//                                    _showBottom();
//                                  },
//                                  child: Text(
//                                    '5 Schedule Appointment',
//                                    style: textStyleTitle5,
//                                  ),
//                                ))),
//                      ],
//                    ),
//                  )),
//            ),
//          )
        ],
      ),
    );
  }

  Widget _buildAppointmentList() {
    return Container(
      height: 295,
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
                  child: Schdeulecard(scheduleModel: scheduleing[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('No Items')),
    );
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
  String _typee;

  final List<String> _dropdownValues = [
    "All",
    "Pending Approval by Manager",
    "Pending Approval by Accounts",
    "Approved",
    "Rejected by Manager",
    "Rejected by Accounts",
    "Disbursed",
  ];

  final List<String> _dropdownValuestype = [
    "New Customer",
    "Existing Customer",
    "Office",
  ];

  bool isCustomerSelect = false;
  bool isLocationIdentifier = false;
  bool isTerritory = true;
  bool isIndustry = true;

  static List<ScheduleModel> scheduleing = Schedulelist.getschedule();
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedName;

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
        "Save Current Location",
        textAlign: TextAlign.center,
      ),
      content: ListView(
//        mainAxisSize: MainAxisSize.min,   ----------------->for column
        shrinkWrap: true,
        children: <Widget>[
          DropdownButtonFormField<String>(
            style: textStyle,
            decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.all(_contentPadding),
                contentPadding: EdgeInsets.all(0.0),
                labelText: 'Select Type',
                labelStyle: hintStyleDropdown,
//                                    prefixIcon: Icon(Icons.apps),
                border: UnderlineInputBorder(
//                                      borderRadius: BorderRadius.circular(_borderradius),
                    )),
            isExpanded: false,
            items: _dropdownValuestype.map((String dropdownstringitem) {
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
                FocusScope.of(context).requestFocus(new FocusNode());
                this._typee = newvalueuser;

                if (newvalueuser == 'Select Type') {
                  isCustomerSelect = false;
                  isLocationIdentifier = false;
                  isTerritory = true;
                  isIndustry = true;
                } else if (newvalueuser == 'New Customer') {
                  isCustomerSelect = true;
                  isLocationIdentifier = true;
                  isTerritory = true;
                  isIndustry = true;
                } else if (newvalueuser == 'Existing Customer') {
                  isCustomerSelect = true;
                  isLocationIdentifier = false;
                  isTerritory = false;
                  isIndustry = false;
                } else if (newvalueuser == 'Office') {
                  isCustomerSelect = false;
                  isLocationIdentifier = false;
                  isTerritory = false;
                  isIndustry = false;
                }
              });
//              _onDropDownItemSelected(newvalueuser);
            },
            value: _typee,
          ),
          Visibility(
            visible: isCustomerSelect,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
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
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              child: TextFormField(
                enabled: false,
                maxLines: 5,
                initialValue:
                    'B/25, Goverdhan Park-1, TP-13, Near Chhani Jakat Naka, Vadodara',
                autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                keyboardType: TextInputType.text,
//                                maxLength: 10,
                style: textStyle,

                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please Enter Description';
                  }
                },
                decoration: InputDecoration(
                  enabled: false,
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: new UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  labelStyle: hintStyleDropdown,
                  hintText: 'Enter Description',
                  hintStyle: hintStyle,
                  labelText: 'Address',

//                                    contentPadding: const EdgeInsets.only(bottom: -10.0)

//                            filled: true,
                ),
              ),
            ),
          ),
          Visibility(
            visible: isLocationIdentifier,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                alignment: Alignment.center,
                child: TextFormField(
                  autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                  keyboardType: TextInputType.text,
//                                maxLength: 10,
                  style: textStyle,

//                validator: (String value) {
//                  if (value.isEmpty) {
//                    return 'Please Enter Description';
//                  }
//                },
                  decoration: InputDecoration(
                    enabled: false,
                    enabledBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: new UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    labelStyle: hintStyleDropdown,
                    hintText: 'Enter Location Identifier',
                    hintStyle: hintStyle,
                    labelText: 'Location Identifier',

//                                    contentPadding: const EdgeInsets.only(bottom: -10.0)

//                            filled: true,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isTerritory,
            child: DropdownButtonFormField<String>(
              style: textStyle,
              decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.all(_contentPadding),
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'Select Territory',
                  labelStyle: hintStyleDropdown,
//                                    prefixIcon: Icon(Icons.apps),
                  border: UnderlineInputBorder(
//                                      borderRadius: BorderRadius.circular(_borderradius),
                      )),
              isExpanded: false,
              items: _dropdownValues.map((String dropdownstringitem) {
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
                  FocusScope.of(context).requestFocus(new FocusNode());
                  this._title = newvalueuser;
                });
//              _onDropDownItemSelected(newvalueuser);
              },
              value: _title,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: isIndustry,
            child: DropdownButtonFormField<String>(
              style: textStyle,
              decoration: InputDecoration(
//                                    contentPadding: EdgeInsets.all(_contentPadding),
                  contentPadding: EdgeInsets.all(0.0),
                  labelText: 'Select Industry',
                  labelStyle: hintStyleDropdown,
//                                    prefixIcon: Icon(Icons.apps),
                  border: UnderlineInputBorder(
//                                      borderRadius: BorderRadius.circular(_borderradius),
                      )),
              isExpanded: false,
              items: _dropdownValues.map((String dropdownstringitem) {
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
                  FocusScope.of(context).requestFocus(new FocusNode());
                  this._title = newvalueuser;
                });
//              _onDropDownItemSelected(newvalueuser);
              },
              value: _title,
            ),
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
          onTap: () => Navigator.pop(context),
          child: new Card(
              elevation: 5.0,
              color: Colors.black,
//          onPressed: null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              )),
              child: Padding(
                child: Text('Save',
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

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    for (var i = 0; i < scheduleing.length; i++) {
      matches.add(scheduleing[i].name);
    }
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
