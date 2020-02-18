import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:unicorndial/unicorndial.dart';
// For changing the language

class AddExpenseScreen extends StatefulWidget {
  @override
  AddExpenseScreenState createState() => AddExpenseScreenState();
}

class AddExpenseScreenState extends State<AddExpenseScreen> {
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
  String startformat = '',starttimeformat='';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime;
//  final ValueChanged<TimeOfDay> selectTime;

  @override
  Widget build(BuildContext context) {

    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Gallery",
        currentButton: FloatingActionButton(
          heroTag: "gallery",
          backgroundColor: Theme.of(context).primaryColor,
          mini: true,
          child: Icon(Icons.filter),
          onPressed: () {},
        )));

    childButtons.add(UnicornButton(
      hasLabel: true,
        labelText: "Camera",
        currentButton: FloatingActionButton(
            heroTag: "camera",
            backgroundColor: Theme.of(context).primaryColor,
            mini: true,
            child: Icon(Icons.camera_alt), onPressed: () {},)));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "PDF",
        currentButton: FloatingActionButton(
            heroTag: "pdf",
            backgroundColor: Theme.of(context).primaryColor,
            mini: true,
            child: Icon(Icons.picture_as_pdf), onPressed: () {},)));

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
                    'Add Expense',
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
              parentButton: Icon(Icons.add),
              childButtons: childButtons),
          body:  Container(
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
                            Container(
                              alignment: Alignment.center,
                              child: TextFormField(
                                autofocus: false,
//                                  focusNode:  FocusScope.of(context).requestFocus(new FocusNode()),
                                keyboardType: TextInputType.text,
//                                maxLength: 10,
                                style: textStyle,
                                controller: headcon,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Expense Head';
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
                                    hintText: 'Enter Expense Head',
                                    hintStyle: hintStyle,
                                    labelText: 'Expense Head'
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
                                keyboardType: TextInputType.number,
//                                maxLength: 10,
                                style: textStyle,
                                controller: amountcon,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Expense Amount';
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
                                    hintText: 'Enter Expense Amount',
                                    hintStyle: hintStyle,
                                    labelText: 'Expense Amount'
//                                    contentPadding: const EdgeInsets.only(bottom: -10.0)

//                            filled: true,
                                ),
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
                                    'Time',
                                    style: labelStyle,
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
                            SizedBox(
                              height: _sizebox,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Icon(Icons.close),
                                        color: Colors.grey[200],
                                        width: MediaQuery.of(context).size.width,
                                        alignment: Alignment.bottomRight,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 170.0,
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: new Image.asset('images/sample.PNG',fit: BoxFit.scaleDown,),
                                        ),
                                        color: Colors.grey[200],
                                      ),
                                      Container(
                                        color: Colors.grey[200],
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: new Image.asset('images/galleryimg.png',width: 40.0,height: 40.0,alignment: Alignment.center,),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                child: Text('6762nhu8y873e8.png',style: textStyle,),
                                              ),
                                            )


                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Icon(Icons.close),
                                        color: Colors.grey[200],
                                        width: MediaQuery.of(context).size.width,
                                        alignment: Alignment.bottomRight,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 170.0,
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: new Image.asset('images/splashscreen.png',fit: BoxFit.scaleDown,),
                                        ),
                                        color: Colors.grey[200],
                                      ),
                                      Container(
                                        color: Colors.grey[200],
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: new Image.asset('images/cameraimg.png',width: 40.0,height: 40.0,alignment: Alignment.center,),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                child: Text('6762nhu8y873e8.png',style: textStyle,),
                                              ),
                                            )


                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Icon(Icons.close),
                                        color: Colors.grey[200],
                                        width: MediaQuery.of(context).size.width,
                                        alignment: Alignment.bottomRight,
                                      ),
                                      Container(
                                        color: Colors.grey[200],
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: new Image.asset('images/pdfimg.png',width: 40.0,height: 40.0,alignment: Alignment.center,),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                child: Text('6762nhu8y873e8.pdf',style: textStyle,),
                                              ),
                                            )


                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                              ],
                            )

                          ],
                        ),
                      ))),
            ),
          ),
      )

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
    final format = DateFormat.jm();  //"6:00 AM"
    return format.format(dt);
  }

}



//import 'package:flutter/material.dart';
//
//import 'package:flutter/services.dart';
//import 'package:file_picker/file_picker.dart';
////import 'package:flutter_document_picker/flutter_document_picker.dart';
//class FilePickerDemo extends StatefulWidget {
//  @override
//  _FilePickerDemoState createState() => new _FilePickerDemoState();
//}
//
//class _FilePickerDemoState extends State<FilePickerDemo> {
//  String _fileName;
//  String _path;
//  Map<String, String> _paths;
//  String _extension;
//  bool _loadingPath = false;
//  bool _multiPick = false;
//  bool _hasValidMime = false;
//  FileType _pickingType;
//  TextEditingController _controller = new TextEditingController();
//
//  @override
//  void initState() {
//    super.initState();
//    _controller.addListener(() => _extension = _controller.text);
//  }
//
//  void _openFileExplorer() async {
//    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
//      setState(() => _loadingPath = true);
//      try {
//        if (_multiPick) {
//          _path = null;
//          _paths = await FilePicker.getMultiFilePath(
//              type: _pickingType, fileExtension: _extension);
//        } else {
//          _paths = null;
//          _path = await FilePicker.getFilePath(
//              type: _pickingType, fileExtension: _extension);
//        }
//      } on PlatformException catch (e) {
//        print("Unsupported operation" + e.toString());
//      }
//      if (!mounted) return;
//      setState(() {
//        _loadingPath = false;
//        _fileName = _path != null
//            ? _path.split('/').last
//            : _paths != null ? _paths.keys.toString() : '...';
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: const Text('File Picker example app'),
//        ),
//        body: new Center(
//            child: new Padding(
//              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//              child: new SingleChildScrollView(
//                child: new Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    new Padding(
//                      padding: const EdgeInsets.only(top: 20.0),
//                      child: new DropdownButton(
//                          hint: new Text('LOAD PATH FROM'),
//                          value: _pickingType,
//                          items: <DropdownMenuItem>[
//                            new DropdownMenuItem(
//                              child: new Text('FROM AUDIO'),
//                              value: FileType.AUDIO,
//                            ),
//                            new DropdownMenuItem(
//                              child: new Text('FROM IMAGE'),
//                              value: FileType.IMAGE,
//                            ),
//                            new DropdownMenuItem(
//                              child: new Text('FROM VIDEO'),
//                              value: FileType.VIDEO,
//                            ),
//                            new DropdownMenuItem(
//                              child: new Text('FROM ANY'),
//                              value: FileType.ANY,
//                            ),
//                            new DropdownMenuItem(
//                              child: new Text('CUSTOM FORMAT'),
//                              value: FileType.CUSTOM,
//                            ),
//                          ],
//                          onChanged: (value) => setState(() {
//                            _pickingType = value;
//                            if (_pickingType != FileType.CUSTOM) {
//                              _controller.text = _extension = '';
//                            }
//                          })),
//                    ),
//                    new ConstrainedBox(
//                      constraints: BoxConstraints.tightFor(width: 100.0),
//                      child: _pickingType == FileType.CUSTOM
//                          ? new TextFormField(
//                        maxLength: 15,
//                        autovalidate: true,
//                        controller: _controller,
//                        decoration:
//                        InputDecoration(labelText: 'File extension'),
//                        keyboardType: TextInputType.text,
//                        textCapitalization: TextCapitalization.none,
//                        validator: (value) {
//                          RegExp reg = new RegExp(r'[^a-zA-Z0-9]');
//                          if (reg.hasMatch(value)) {
//                            _hasValidMime = false;
//                            return 'Invalid format';
//                          }
//                          _hasValidMime = true;
//                          return null;
//                        },
//                      )
//                          : new Container(),
//                    ),
//                    new ConstrainedBox(
//                      constraints: BoxConstraints.tightFor(width: 200.0),
//                      child: new SwitchListTile.adaptive(
//                        title: new Text('Pick multiple files',
//                            textAlign: TextAlign.right),
//                        onChanged: (bool value) =>
//                            setState(() => _multiPick = value),
//                        value: _multiPick,
//                      ),
//                    ),
//                    new Padding(
//                      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
//                      child: new RaisedButton(
//                        onPressed: () => _openFileExplorer(),
//                        child: new Text("Open file picker"),
//                      ),
//                    ),
//                    new Builder(
//                      builder: (BuildContext context) => _loadingPath
//                          ? Padding(
//                          padding: const EdgeInsets.only(bottom: 10.0),
//                          child: const CircularProgressIndicator())
//                          : _path != null || _paths != null
//                          ? new Container(
//                        padding: const EdgeInsets.only(bottom: 30.0),
//                        height: MediaQuery.of(context).size.height * 0.50,
//                        child: new Scrollbar(
//                            child: new ListView.separated(
//                              itemCount: _paths != null && _paths.isNotEmpty
//                                  ? _paths.length
//                                  : 1,
//                              itemBuilder: (BuildContext context, int index) {
//                                final bool isMultiPath =
//                                    _paths != null && _paths.isNotEmpty;
//                                final String name = 'File $index: ' +
//                                    (isMultiPath
//                                        ? _paths.keys.toList()[index]
//                                        : _fileName ?? '...');
//                                final path = isMultiPath
//                                    ? _paths.values.toList()[index].toString()
//                                    : _path;
//
//                                return new ListTile(
//                                  title: new Text(
//                                    name,
//                                  ),
//                                  subtitle: new Text(path),
//                                );
//                              },
//                              separatorBuilder:
//                                  (BuildContext context, int index) =>
//                              new Divider(),
//                            )),
//                      )
//                          : new Container(),
//                    ),
//                  ],
//                ),
//              ),
//            )),
//      ),
//    );
//  }
//}

