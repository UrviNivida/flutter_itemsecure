import 'package:flutter/material.dart';

import 'FadeAnimation.dart';


class forgotpasswor_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return forgotpasswor_screenstate();
  }
}

class forgotpasswor_screenstate extends State<forgotpasswor_screen> {
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

  @override
  Widget build(BuildContext context) {
    TextStyle welcomestyle = TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Colors.black);

    TextStyle itemstyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Colors.black);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xFFF8C300),
          Color(0xFFFFEE58),
          Color(0xFFF8C300)
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1.6,
                      Text("Forgot password",
                          style: welcomestyle))
                ],
              ),
            ),
            SizedBox(height: 35),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFf4f7fc),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 50),
                          FadeAnimation(
                              1.6,
                              Container(
                                child: TextField(
                                    decoration: InputDecoration(
//                                        contentPadding: EdgeInsets.all(20.0),
                                        labelText: "Email Address / Mobile No.",
                                        hintText: "Email Address / Mobile No.",
                                        hintStyle: hintStyle,
                                        prefixIcon: Icon(Icons.account_circle),
//                                        suffixIcon: GestureDetector(
//                                          child: Icon(Icons.cancel),
//                                          onTap: () {
//                                            setState(() {
//                                            });
//                                          },
//                                        ),
                                        border: OutlineInputBorder(
                                            gapPadding: 10.0,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25.0))))

//                                    InputDecoration(
//                                        hintText: "Email Address / Mobile No.",
//                                        hintStyle: hintStyle,
//                                        labelStyle: textStyle,
//                                        border: InputBorder.none),

                                ),
                              )),
                          SizedBox(height: 10),
                          SizedBox(height: 40),
                          FadeAnimation(
                              2.2,
                              GestureDetector(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerRight,
                                          colors: [
                                            Color(0xFFF8C300),
                                            Color(0xFFFFEE58)
                                          ])),
                                  child: Center(
                                    child: Text("Submit", style: headStyle),
                                  ),
                                ),
//                                onTap: () {
//                                  Navigator.push(context,
//                                    MaterialPageRoute(builder: (context) {
//                                      return DashbaroadScreen();
//                                    }));
//                                  },
                              ))
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
