import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_itemsecure_dsr/app_screens/navigation_drawer.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        //        automaticallyImplyLeading: false,
        //        centerTitle: true,
        icon: Icon(Icons.menu, color: Colors.black), // set your color here
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NavigationDrawerScreen();
          }));
        },
      ),
        title: Text(
          'Expenses',
          style: headStyle,
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                width: 32,
                height: 32,
                child: Stack(
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 35,
                        )),
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 19,
                        height: 19,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(color: Colors.white, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Center(
                              child: Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "1",
                                  style: headStyle,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: NavigationDrawerScreen(),
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
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text('111'),
                Text('111'),
                Text('111'),
                Text('111'),
              ],
            ),
          )
        ],
      ),

    );
  }
}
