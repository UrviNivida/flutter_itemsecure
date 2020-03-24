//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
//class AddVisitDocsScreen extends StatefulWidget {

////  MyHomePage({Key key, this.title}) : super(key: key);
////
////  final String title;
//
//  @override
//  AddVisitDocsScreenState createState() => AddVisitDocsScreenState();
//}
//
//class AddVisitDocsScreenState extends State<AddVisitDocsScreen> {
//  List<String> _imageList = List();
//  List<int> _selectedIndexList = List();
//  bool _selectionMode = false;
//
//  @override
//  Widget build(BuildContext context) {
//    List<Widget> _buttons = List();
//    if (_selectionMode) {
//      _buttons.add(IconButton(
//          icon: Icon(Icons.delete),
//          onPressed: () {
//            setState(() {
//              print(_imageList[0]);
//              _imageList.remove(_imageList[0]);
//              _selectedIndexList.sort();
//              print(
//                  'Delete ${_selectedIndexList.length} items! Index: ${_selectedIndexList.toString()}');
//            });
////            print(_imageList[0]);
////            _imageList.remove(_imageList[0]);
////            _selectedIndexList.sort();
////            print('Delete ${_selectedIndexList.length} items! Index: ${_selectedIndexList.toString()}');
//          }));
//    }
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("fsafs"),
//        actions: _buttons,
//      ),
//      body: _createBody(),
//    );
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _imageList.add('https://picsum.photos/800/600/?image=280');
//    _imageList.add('https://picsum.photos/800/600/?image=281');
//    _imageList.add('https://picsum.photos/800/600/?image=282');
//    _imageList.add('https://picsum.photos/800/600/?image=283');
//    _imageList.add('https://picsum.photos/800/600/?image=284');
//  }
//
//  void _changeSelection({bool enable, int index}) {
//    _selectionMode = enable;
//    _selectedIndexList.add(index);
//    if (index == -1) {
//      _selectedIndexList.clear();
//    }
//  }
//
//  Widget _createBody() {
//    return StaggeredGridView.countBuilder(
//      crossAxisCount: 2,
//      mainAxisSpacing: 4.0,
//      crossAxisSpacing: 4.0,
//      primary: false,
//      itemCount: _imageList.length,
//      itemBuilder: (BuildContext context, int index) {
//        return getGridTile(index);
//      },
//      staggeredTileBuilder: (int index) => StaggeredTile.count(1, 1),
//      padding: const EdgeInsets.all(4.0),
//    );
//  }
//
//  GridTile getGridTile(int index) {
//    if (_selectionMode) {
//      return GridTile(
//          header: GridTileBar(
//            leading: Icon(
//              _selectedIndexList.contains(index)
//                  ? Icons.check_circle_outline
//                  : Icons.radio_button_unchecked,
//              color: _selectedIndexList.contains(index)
//                  ? Colors.green
//                  : Colors.black,
//            ),
//          ),
//          child: GestureDetector(
//            child: Container(
//              decoration: BoxDecoration(
//                  border: Border.all(color: Colors.blue[50], width: 30.0)),
//              child: Image.network(
//                _imageList[index],
//                fit: BoxFit.cover,
//              ),
//            ),
//            onLongPress: () {
//              setState(() {
//                _changeSelection(enable: false, index: -1);
//              });
//            },
//            onTap: () {
//              setState(() {
//                if (_selectedIndexList.contains(index)) {
//                  _selectedIndexList.remove(index);
////                  _imageList.remove(_imageList[index]);
//                  print(index);
//                } else {
//                  _selectedIndexList.add(index);
//                }
//              });
//            },
//          ));
//    } else {
//      return GridTile(
//        child: InkResponse(
//          child: Image.network(
//            _imageList[index],
//            fit: BoxFit.cover,
//          ),
//          onLongPress: () {
//            setState(() {
//              _changeSelection(enable: true, index: index);
//            });
//          },
//        ),
//      );
//    }
//  }
//}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:unicorndial/unicorndial.dart';
// For changing the language

class AddVisitDocsScreen extends StatefulWidget {
  @override
  AddVisitDocsScreenState createState() => AddVisitDocsScreenState();
}

class AddVisitDocsScreenState extends State<AddVisitDocsScreen> {
  var _paddingbottom = 1.0;
  var _paddingtop = 15.0;
  var _formKey = GlobalKey<FormState>();
  var displayResult = '';
  var _fieldPadding = 25.0;
  var _sizebox = 15.0;

  TextEditingController headcon = new TextEditingController();
  TextEditingController amountcon = new TextEditingController();
  TextEditingController startdatecon = new TextEditingController();
  TextEditingController starttimecon = new TextEditingController();

  List<String> _checked = ["A", "B"];
  String _picked = "Customer";

  var _currentItemSelected;
  var _currencies = ['New', 'Existing'];

  final List<ScheduleModel> scheduleing = Schedulelist.getschedule();

  final format = DateFormat("yyyy-MM-dd");

//  final format = TimeOfDayFormat("yyyy-MM-dd");
  String startformat = '', starttimeformat = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime;

  final format1 = DateFormat("dd-MM-yyyy");
  final timeFormat = DateFormat("h:mm a");
  DateTime date;
  TimeOfDay time;

//  final ValueChanged<TimeOfDay> selectTime;

  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return GestureDetector(
          child: Stack(
            children: <Widget>[
              AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              ),
              Container(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    child: Icon(Icons.delete_sweep, color: Colors.red),
                    onTap: () {
                      setState(() {
                        images.removeAt(index);
                      });
                    },
                  ))
            ],
          ),
          onLongPress: () {
            print(index);
          },
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    print(error);

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#F8C300",
          actionBarTitle: "ItemSecure",
          statusBarColor: "#D9A800",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
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
                      'Add Ongoing Visit Docs',
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
        body: Scaffold(
          floatingActionButton: UnicornDialer(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
            parentButtonBackground: Theme.of(context).primaryColor,
            orientation: UnicornOrientation.HORIZONTAL,
            parentButton: Icon(Icons.add_photo_alternate),
            onMainButtonPressed: loadAssets,
//              childButtons: childButtons
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
                            SizedBox(
                              height: _sizebox,
                            ),
                            buildGridView(),
                         ],
                        ),
                      ))),
            ),
          ),
        ));
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      FocusScope.of(context).requestFocus(new FocusNode());
      this._currentItemSelected = newValueSelected;
    });
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }
}
