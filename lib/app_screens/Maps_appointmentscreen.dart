import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/model/Schdeulecard.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
import 'package:flutter_itemsecure_dsr/model/Schedulelist.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'NavigationBloc.dart';


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
  TextStyle textStyleTitle5 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color(0xFFF8C300));
  TextStyle headStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);
  TextStyle headStyle1 = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.white);

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

  void _showBottom() {
    showModalBottomSheet<void>(
        context: context,
        /*bottom sheet is like a drawer that pops off where you can put any
      controls you want, it is used typically for user notifications*/
        //builder lets your code generate the code
        builder: (BuildContext context) {
          return new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '5 Schedule Appointment',
                  style: textStyleTitle5,
                ),
                SizedBox(
                  height: 15.0,
                ),
                _buildMoviesList()
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
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
                  )),
                ),
              ],
            ),
          ),
          _tabSection(context),
        ],
      ),
    ));
  }

  Widget _tabSection(BuildContext context) {
    return Container(
      height: 500,
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(_padding),
              child: Container(
                  color: Colors.white,

//                                  margin: const EdgeInsets.only(
//                                      left: 10.0, right: 10.0),
                  child: new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                                child: GestureDetector(
                              onTap: () {
                                _showBottom();
                              },
                              child: Text(
                                '5 Schedule Appointment',
                                style: textStyleTitle5,
                              ),
                            ))),
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMoviesList() {
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
