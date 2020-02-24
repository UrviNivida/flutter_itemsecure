import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('urvi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the FAB to present the dialog!',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: ((BuildContext context) {
                return DynamicDialog(title: 'Original Title');
              }));
        },
        tooltip: 'Show Dialog',
        child: Icon(Icons.add),
      ),
    );
  }
}

class DynamicDialog extends StatefulWidget {
  DynamicDialog({this.title});

  final String title;

  @override
  _DynamicDialogState createState() => _DynamicDialogState();
}

class _DynamicDialogState extends State<DynamicDialog> {
  String _title;

  final List<String> _dropdownValues = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five"
  ];

  @override
  void initState() {
    _title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content:

      DropdownButton(
        items: _dropdownValues
            .map((value) => DropdownMenuItem(
          child: Text(value),
          value: value,
        )).toList(),
        onChanged: (String value) {
          setState(() {
            _title = value;
          });
        },
        value: _title,
        isExpanded: false,
        hint: Text('Select Number'),
      ),

      actions: <Widget>[
        FlatButton(
            onPressed: () {
              final newText = 'Updated Title!';
              setState(() {
                _title = newText;
              });
            },
            child: Text('Change')),

      ],
    );
  }
}