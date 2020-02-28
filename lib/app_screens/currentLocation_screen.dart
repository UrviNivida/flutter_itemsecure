import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class currentLocation_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return currentLocation_screen_state();
  }
}

class currentLocation_screen_state extends State<currentLocation_screen> {
  var _padding = 12.0;
  bool _value = true;
  var _imageheight = 40.0;
  var _imagewidth = 40.0;

  TextStyle textStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);

  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _mainLocation = const LatLng(22.317498, 73.164598);

  @override
  void initState() {
    super.initState();
//    getlocation();


  }

//  Future getlocation() async {
//    setState(() {
//      Fluttertoast.showToast(
//          msg: "Current Location : \n  Time : 9:20 AM",
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.TOP,
//          timeInSecForIos: 1,
//          backgroundColor: Colors.black45,
//          textColor: Colors.white,
//          fontSize: 16.0);
//      print("Every time open call activity");
//    });
//
//  }

//  <com.dm.dmmonitoring_master.customfonts.MyTextViewBold
//  android:layout_width="20dp"
//  android:layout_height="wrap_content"
//
//  android:layout_marginTop="1dp"
//  android:ellipsize="end"
//  android:gravity="start|center"
//  android:maxLines="2"
//  android:text="kg/cm²"
//  android:textColor="@color/textColorPrimary"
//  android:textSize="10sp" />
  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_mainLocation.toString()),
        position: _mainLocation,
        infoWindow: InfoWindow(
          onTap: () {},
          title: 'Nivida Web Solutions Pvt. Ltd.',
          snippet:
              '305, Privilege Avenue, Opp. isha hospital, Behind atlantis Sarabhai campus, Sarabhai Rd, Vadiwadi, Vadodara, Gujarat 390023',
        ),
        onTap: () {},
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    Fluttertoast.showToast(
        msg: "Current Location : \n  Time : 9:20 AM",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
    print("Every time open call activity");

    return _markers;
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: new Container(
            // padding: const EdgeInsets.fromLTRB(0, 0, 3.0, 0),
            child: new Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('images/galleryimg.png'),
            minRadius: 23,
            maxRadius: 23,
          ),
        )),
        centerTitle: true,
        title: ListTile(
          title: Text(
            "Khushali Thakkar",
            style: textStyle,
          ),
          subtitle: Text(
            "Manager",
            style: textStyle,
          ),
        ),
        actions: <Widget>[
          new Icon(Icons.call, color: Colors.black),
          new Icon(Icons.message, color: Colors.black)
        ],
      )
//        title: new Container(
//            child: new Row(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            new Container(
//              // padding: const EdgeInsets.fromLTRB(0, 0, 3.0, 0),
//              child: new Center(
//                child: CircleAvatar(
//                  backgroundImage: AssetImage('images/no_profilee.png'),
//                  minRadius: 23,
//                  maxRadius: 23,
//                ),
//              ),
//            ),
//            new Container(
//              padding: const EdgeInsets.only(left: 8.0),
//              child: new Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  new Center(
//                    child: new Text(
//                      widget.name,
//                      style: headStyle,
//                    ),
//                  ),
//                  new Text(
//                    "last seen." + widget.formattedDate,
//                    style: titlestyle,
//                  ),
//                ],
//              ),
//            ),
//          ],
//        )),
      ,
      body: _tabSection(context),
    );


  }

  Widget _tabSection(BuildContext context) {



    return Container(
//      height: 520,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _mainLocation,
              zoom: 10.0,
            ),
            markers: this.myMarker(),
//            circles: circles,
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
////
// left: 10.0, right: 10.0),
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



}
