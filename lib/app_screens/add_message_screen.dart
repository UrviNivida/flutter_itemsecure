import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
import 'package:intl/intl.dart';
import 'package:speech_bubble/speech_bubble.dart';

import 'chat_screen.dart';

class add_message_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return add_message_screenState();
  }
}

class add_message_screenState extends State<add_message_screen> {
  double _offsetContainer;
  var _text;
  var _oldtext;
  var _heightscroller;
  var _itemsizeheight = 65.0; //NOTE: size items
  var _marginRight = 50.0;
  var _sizeheightcontainer;
  var posSelected = 0;
  var diff = 0.0;
  var height = 0.0;
  var txtSliderPos = 0.0;
  ScrollController _controller;
  String message = "";


  final List<ScheduleModel> duplicateItems = Schedulelist.getschedule();
  var items = List<ScheduleModel>();
  TextEditingController editingController = TextEditingController();
  FocusNode searchFocus;

  @override
  void dispose() {
    // TODO: implement dispose
    searchFocus.dispose();
    super.dispose();
  }


  List exampleList = [
    'Brijesh Parekh',
    'Chintan Mahant',
    'Khushali Thakkar',
    'Urvi Suthar',
    'Vishal Mahant',
  ];

  List _alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  @override
  void initState() {
// TODO: implement initState

    items.addAll(duplicateItems);
    searchFocus = FocusNode();

    _offsetContainer = 0.0;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    //sort the item list
    exampleList.sort((a, b) {
      return a.toString().compareTo(b.toString());
    });
    super.initState();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if ((_offsetContainer + details.delta.dy) >= 0 &&
          (_offsetContainer + details.delta.dy) <=
              (_sizeheightcontainer - _heightscroller)) {
        _offsetContainer += details.delta.dy;
        posSelected =
            ((_offsetContainer / _heightscroller) % _alphabet.length).round();
        _text = _alphabet[posSelected];
        if (_text != _oldtext) {
          for (var i = 0; i < exampleList.length; i++) {
            if (_text
                    .toString()
                    .compareTo(exampleList[i].toString().toUpperCase()[0]) ==
                0) {
              _controller.jumpTo(i * _itemsizeheight);
              break;
            }
          }
          _oldtext = _text;
        }
      }
    });
  }

  void _onVerticalDragStart(DragStartDetails details) {
//    var heightAfterToolbar = height - diff;
//    print("height1 $heightAfterToolbar");
//    var remavingHeight = heightAfterToolbar - (20.0 * 26);
//    print("height2 $remavingHeight");
//
//    var reducedheight = remavingHeight / 2;
//    print("height3 $reducedheight");
    _offsetContainer = details.globalPosition.dy - diff;
  }

  TextStyle headStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);
  TextStyle titlestyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);



  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    var _padding = 12.0;
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 3.0,
          leading: new IconButton(
            icon: new Icon(Icons.menu, color: Colors.black),
          ),
          title: Text("Message", style: headStyle),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(_padding),
          child: Column(
            children: <Widget>[
              searchFilterWidget(),
//              SizedBox(
//                height: 1,
//              ),
//              TextFormField(
//                  keyboardType: TextInputType.text,
//                  decoration: InputDecoration(
//                    enabledBorder: OutlineInputBorder(
//                      borderSide: BorderSide(color: Colors.yellow, width: 1.0),
//                    ),
//                    contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//                    border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(5.0)),
//                    hintText: 'Serach message',
//                    prefixIcon: Icon(Icons.search, color: Colors.black),
//                  )),
//              SizedBox(
//                height: 5,
//              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, contrainsts) {
                    diff = height - contrainsts.biggest.height;
                    _heightscroller =
                        (contrainsts.biggest.height) / _alphabet.length;
                    _sizeheightcontainer = (contrainsts.biggest.height); //NO
                    return new Stack(children: [
                      ListView.builder(
                        itemCount: exampleList.length,
                        controller: _controller,
                        itemExtent: _itemsizeheight,
                        itemBuilder: (context, position) {
                          return GestureDetector(
                            onTap: () {
                              DateTime now = DateTime.now();
                              String formattedDate =
                                  DateFormat('EEE d MMM kk:mm').format(now);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => chat_screen(
                                          name: exampleList[position],
                                          formattedDate: formattedDate)));
                              print(exampleList[position]);
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  exampleList[position],
                                  style: titlestyle,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        right: _marginRight,
                        top: _offsetContainer,
                        child: _getSpeechBubble(),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalDragUpdate,
                          onVerticalDragStart: _onVerticalDragStart,
                          child: Container(
                            //height: 20.0 * 26,
                            color: Colors.transparent,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: []..addAll(
                                  new List.generate(_alphabet.length,
                                      (index) => _getAlphabetItem(index)),
                                ),
                            ),
                          ),
                        ),
                      ),
                    ]);
                  },
                ),
              ),
            ],
          ),
        ));
  }

  _getSpeechBubble() {
    return new SpeechBubble(
      nipLocation: NipLocation.RIGHT,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 30,
            child: Center(
              child:
                  Text("${_text ?? "${_alphabet.first}"}", style: titlestyle),
            ),
          ),
        ],
      ),
    );
  }

  ValueGetter callback(int value) {}

  _getAlphabetItem(int index) {
    return new Expanded(
      child: new Container(
        width: 40,
        height: 20,
        alignment: Alignment.center,
        child: new Text(
          _alphabet[index],
          style: (index == posSelected)
              ? new TextStyle(fontSize: 16, fontWeight: FontWeight.w700)
              : new TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  //scroll detector for reached top or bottom
  _scrollListener() {
    if ((_controller.offset) >= (_controller.position.maxScrollExtent)) {
      print("reached bottom");
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print("reached top");
    }
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
      padding: EdgeInsets.all(5.0),
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

            ],
          ),
        ],
      ),
    );
  }

}
