//
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
//import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
//import 'package:flutter_typeahead/flutter_typeahead.dart';
//
//class FormExample extends StatefulWidget {
//  @override
//  _FormExampleState createState() => _FormExampleState();
//}
//
//class _FormExampleState extends State<FormExample> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  final TextEditingController _typeAheadController = TextEditingController();
//
//  String _selectedCity;
//  static List<ScheduleModel> schedulesearchname=Schedulelist.getschedule();
//
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      child:  Form(
//        key: this._formKey,
//        child: Padding(
//          padding: EdgeInsets.all(0.0),
//          child: Column(
//            children: <Widget>[
//              Text('What is your favorite city?'),
//              TypeAheadFormField(
//                textFieldConfiguration: TextFieldConfiguration(
//                  decoration: InputDecoration(labelText: 'City'),
//                  controller: this._typeAheadController,
//                ),
//                suggestionsCallback: (pattern) {
//                  return getSuggestions(pattern);
////                return CitiesService.getSuggestions(pattern);
//                },
//                itemBuilder: (context, suggestion) {
//                  return ListTile(
//                    title: Text(suggestion),
//                  );
//                },
//                transitionBuilder: (context, suggestionsBox, controller) {
//                  return suggestionsBox;
//                },
//                onSuggestionSelected: (suggestion) {
//                  this._typeAheadController.text = suggestion;
//                },
//                validator: (value) {
//                  if (value.isEmpty) {
//                    return 'Please select a city';
//                  }
//                },
//                onSaved: (value) => this._selectedCity = value,
//              ),
//              SizedBox(
//                height: 10.0,
//              ),
//              RaisedButton(
//                child: Text('Submit'),
//                onPressed: () {
//                  if (this._formKey.currentState.validate()) {
//                    this._formKey.currentState.save();
//                    Scaffold.of(context).showSnackBar(SnackBar(
//                        content:
//                        Text('Your Favorite City is ${this._selectedCity}')));
//                  }
//                },
//              )
//            ],
//          ),
//        ),
//      )
//    );
//  }
//
//
//  static List<String> getSuggestions(String query) {
//    List<String> matches = List();
//    for(var i = 0; i < schedulesearchname.length; i++){
//      matches.add(schedulesearchname[i].name);
//    }
//    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
//    return matches;
//  }
//}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'profile_screen.dart';
// For changing the language

class SettingsScreen extends StatefulWidget {
  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    TextStyle headStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Colors.black);

    TextStyle textHeadYellowStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);

    TextStyle textHeadStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Colors.black);

    TextStyle textStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
        fontFamily: 'Quicksand',
        color: Colors.black);


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
                    'Settings',
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
              color: Theme.of(context).primaryColor,
            ), onPressed: () {},

          ),

        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0,bottom: 10.0,right: 20.0,top: 20.0),
              child: Text('Profile',style: textHeadYellowStyle,),
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.grey[200],
                  child:  ListTile(
                    title: Text(
                      "Urvi Suthar",
                      style: textHeadStyle,
                    ),
                    subtitle: Text(
                      "Android Developer",
                      style: textStyle,
                    ),
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.perm_identity,
                        color: Colors.white,
                      ),
                      radius: 30,
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return profile_screen();
                    }));
              },
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(left: 20.0,bottom: 10.0,right: 20.0,top: 20.0),
                child: Text('About',style: textHeadYellowStyle,),
              ),
            ),
            GestureDetector(
              child:  Padding(
                  padding: EdgeInsets.only(left: 10.0,bottom: 10.0,right: 10.0,top: 10.0),
                  child: Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Help',style: textHeadStyle,),
                      )
                  )
              ),
            ),
            GestureDetector(
              child:  Padding(
                  padding: EdgeInsets.only(left: 10.0,bottom: 10.0,right: 10.0,top: 10.0),
                  child: Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Terms Of Use',style: textHeadStyle,),
                      )
                  )
              ),
            ),
            GestureDetector(
              child:  Padding(
                  padding: EdgeInsets.only(left: 10.0,bottom: 10.0,right: 10.0,top: 10.0),
                  child: Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Legal & Privacy',style: textHeadStyle,),
                      )
                  )
              ),
            )

          ],
        ),
      ),
    );
  }
}
