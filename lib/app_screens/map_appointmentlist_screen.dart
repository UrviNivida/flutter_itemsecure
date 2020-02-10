import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MapAppointmentListScreen extends StatefulWidget {
  @override
  _MapAppointmentListScreenState createState() =>
      _MapAppointmentListScreenState();
}

class _MapAppointmentListScreenState extends State<MapAppointmentListScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Item In ListView with PopupMenuButton Example"),
      ),
    );
  }
}
