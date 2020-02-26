import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_itemsecure_dsr/adapters/myteam_layout.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'NavigationBloc.dart';
import 'navigation_drawer.dart';

class MyTeamScreen extends StatefulWidget {
  @override
  MyTeamScreenState createState() => MyTeamScreenState();
}

class MyTeamScreenState extends State<MyTeamScreen> {
  var _padding = 12.0;
  var _imageheight = 40.0;
  var _imagewidth = 40.0;
  var _circlePadding = 8.0;

  final List<ScheduleModel> duplicateItems = Schedulelist.getschedule();
  var items = List<ScheduleModel>();
  TextEditingController editingController = TextEditingController();
  FocusNode searchFocus;

  @override
  void initState() {
    items.addAll(duplicateItems);
    searchFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchFocus.dispose();
    super.dispose();
  }

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
          'My Team',
          style: headStyle,
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[],
      ),
      drawer: new NavigationDrawerScreen(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            searchFilterWidget(),
          ],
        ),
      ),
    );
  }

  void filterSearchResults(String query) {
    List<ScheduleModel> dummySearchList = List<ScheduleModel>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<ScheduleModel> dummyListData = List<ScheduleModel>();
      dummySearchList.forEach((item) {
        if (item.title.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  Widget searchFilterWidget() {
    TextStyle hintStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w200,
      fontFamily: 'Quicksand',
    );

    TextStyle textStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Colors.black);

    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextField(
                    style: textStyle,
                    focusNode: searchFocus,
//                    focusNode: FocusScopeNode(canRequestFocus: true),
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: editingController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
//                    labelText: "Search",
                        hintText: "Search",
                        hintStyle: hintStyle,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: GestureDetector(
                          child: Icon(Icons.cancel),
                          onTap: () {
                            setState(() {
                              editingController.clear();
                              items.clear();
                              items.addAll(duplicateItems);
//                           FocusScope.of(context).requestFocus(searchFocus);
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            gapPadding: 10.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: ((BuildContext context) {
                              return DynamicDialog();
                            }));
                      },
                      child: Container(
//                        child: Text('Filter'),
                          child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ),

//              Padding(
//                padding: const EdgeInsets.all(0.0),
//                child: Card(
//                  child: InkWell(
//                    splashColor: Colors.blue.withAlpha(30),
//                    onTap: () {
//                      print('Card tapped.');
//                    },
//                    child: Container(
//                      width: 300,
//                      height: 100,
//                      child: Text('A card that can be tapped'),
//                    ),
//                  ),
//                ),
//              ),
            ],
          ),
          Expanded(
            child: _buildAppointmentList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentList() {
    return Container(
      child: items.length > 0
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.removeAt(index);
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
                  child: MyTeamLayout(scheduleModel: items[index]),
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

  String _picked = "Any";

  Map<String, bool> numbers = {
    'One': false,
    'Two': false,
    'Three': false,
    'Four': false,
    'Five': false,
    'Six': false,
    'Seven': false,
  };
  var holder_1 = [];

  @override
  void initState() {
//    _title = widget.title;
    super.initState();
  }

  getItems() {
    numbers.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle headstyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
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

    return AlertDialog(
      titlePadding: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(15),
      )),
      title: Text(
        "Filter My Team",
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min, //----------------->for column
//        shrinkWrap: true,
        children: <Widget>[
          Container(
//            height: 10.0,
            child: Text('Status',style: headstyle,),
          ),
          const MySeparator(color: Colors.grey),
          RadioButtonGroup(
            labelStyle: textStyle,
            orientation: GroupedButtonsOrientation.VERTICAL,
//            margin: const EdgeInsets.only(left: 12.0),
            onSelected: (String selected) => setState(() {
              _picked = selected;
            }),
            labels: <String>[
              "Any",
              "In Meeting",
              "In Office",
              "On Field",
              "Not Punched-In",
              "Punched-Out",
            ],
            picked: _picked,
            itemBuilder: (Radio rb, Text txt, int i) {
              return Row(
                children: <Widget>[
//                                    Icon(Icons.public),
                  rb,
                  txt,
                ],
              );
            },
          ),
          Container(
//            height: 10.0,
            child: Text('Territory',style: headstyle,),
          ),
          const MySeparator(color: Colors.grey),
          Expanded(
            child: ListView(
              children: numbers.keys.map((String key) {
                return new CheckboxListTile(
                  title: new Text(key,style: textStyle,),
                  value: numbers[key],
                  activeColor: Theme.of(context).accentColor,
                  checkColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      numbers[key] = value;
                    });
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
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
                child: Text('Clear',
                    style: TextStyle(
                        fontSize: 14, color: Colors.white)),
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 16.0, left: 16.0),
              )),
        ),
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

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    for (var i = 0; i < scheduleing.length; i++) {
      matches.add(scheduleing[i].name);
    }
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 4.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
