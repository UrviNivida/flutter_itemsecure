import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_itemsecure_dsr/adapters/expenselist_layout.dart';
import 'package:flutter_itemsecure_dsr/app_screens/navigation_drawer.dart';
import 'package:flutter_itemsecure_dsr/listing_data/Schedulelist.dart';
import 'package:flutter_itemsecure_dsr/model/ScheduleModel.dart';

import 'NavigationBloc.dart';
import 'SideBar.dart';


class ExpenseListScreen extends StatefulWidget {
  @override
  ExpenseListScreenState createState() => ExpenseListScreenState();
}

class ExpenseListScreenState extends State<ExpenseListScreen> {

  TextStyle headStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);

  TextStyle titleStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);

  TextStyle valueStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.grey);

  final List<ScheduleModel> scheduleing = Schedulelist.getschedule();

  @override
  Widget build(BuildContext context) {
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
          'Expenses',
          style: headStyle,
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: new Icon(Icons.add),
                onPressed: (){},
              ),
              IconButton(
                icon: new Icon(Icons.filter_list),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
      drawer: new NavigationDrawerScreen(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: Stack(
            children: <Widget>[
              expenseListWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget expenseListWidget()
  {
    return new
    Padding(padding: EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text('Claimed',textAlign: TextAlign.left,style: titleStyle),
            ),
            Expanded(
              flex: 1,
              child: Text('₹ '+'380.0',textAlign: TextAlign.right,style: valueStyle),
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text('Approved',textAlign: TextAlign.left,style: titleStyle),
            ),
            Expanded(
              flex: 1,
              child: Text('₹ '+'0.0',textAlign: TextAlign.right,style: valueStyle),
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text('Disbursed',textAlign: TextAlign.left,style: titleStyle),
            ),
            Expanded(
              flex: 1,
              child: Text('₹ '+'0.0',textAlign: TextAlign.right,style: valueStyle),
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text('Date Range',textAlign: TextAlign.left,style: titleStyle),
            ),
            Expanded(
              flex: 1,
              child: Text('Current Month',textAlign: TextAlign.right,style: valueStyle),
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        new Expanded(child: _buildExpenseList(),)
      ],
    ));
  }


  Widget _buildExpenseList() {
    return Container(

//      width: MediaQuery.of(context).size.width,
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
            child: ExpenseListLayout(scheduleModel: scheduleing[index]),
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
          );
        },
      )
          : Center(child: Text('No Items')),
    );
  }
}
