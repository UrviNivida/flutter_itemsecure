import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dashboard_screen.dart';
import 'FadeAnimation.dart';
import 'forgotpasswor_screen.dart';

class Loginscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Loginscreennew();
  }
}

class Loginscreennew extends State<Loginscreen> {
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

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime _CurrentDateTime;
  String _CurrentDate='';

  String _email, _passwaord;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    TextStyle welcomestyle = TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        color: Colors.black);
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _CurrentDateTime = DateTime.now();
      _CurrentDate = DateFormat('yMMMd').format(_CurrentDateTime);
    }

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
          Theme.of(context).primaryColor,
          Color(0xFFFFEE58),
          Theme.of(context).primaryColor
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
                  FadeAnimation(1.2, Text("Welcome", style: welcomestyle)),
                  FadeAnimation(
                      1.6, Text("Login to ItemSecure", style: itemstyle))
                ],
              ),
            ),
            SizedBox(height: 35),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
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
//                                decoration: BoxDecoration(
//                                    color: Colors.white,
//                                    borderRadius: BorderRadius.circular(15),
//                                    boxShadow: [
//                                      BoxShadow(
//                                          color: Colors.black.withOpacity(0.1),
//                                          blurRadius: 8,
//                                          offset: Offset(0, 3))
//                                    ]),
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
                          FadeAnimation(
                              1.9,
                              Container(
//                                decoration: BoxDecoration(
//                                    color: Colors.white,
//                                    borderRadius: BorderRadius.circular(5),
//                                    boxShadow: [
//                                      BoxShadow(
//                                          color: Colors.black.withOpacity(0.1),
//                                          blurRadius: 8,
//                                          offset: Offset(0, 3))
//                                    ]),
                                child: TextFormField(
                                    autofocus: false,
                                    obscureText: _obscureText,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
//                                        contentPadding: EdgeInsets.all(20.0),
                                        labelText: "Password",
                                        hintText: "Password",
                                        hintStyle: hintStyle,
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          child: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            semanticLabel: _obscureText
                                                ? 'show password'
                                                : 'hide password',
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            gapPadding: 10.0,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25.0)))),

//                                      InputDecoration(
//                                        border: InputBorder.none,
//                                        hintStyle: hintStyle,
//                                        labelStyle: textStyle,
//                                        hintText: 'Password',
//                                        suffixIcon: GestureDetector(
//                                          onTap: () {
//                                            setState(() {
//                                              _obscureText = !_obscureText;
//                                            });
//                                          },
//                                          child: Icon(
//                                            _obscureText
//                                                ? Icons.visibility
//                                                : Icons.visibility_off,
//                                            semanticLabel: _obscureText
//                                                ? 'show password'
//                                                : 'hide password',
//                                          ),
//                                        ),
//                                      ),

                                    onSaved: (String value) {}),
                              )),
                          SizedBox(height: 30),
                          FadeAnimation(2,
                              GestureDetector(
                                child: Text("Forget your password?", style: headStyle),
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return forgotpasswor_screen();
                                      }));
                                },
                              )
                              ),
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
                                      child: Text("Login", style: headStyle),
                                  ),
                                ),
                                onTap: () {Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return DashbaroadScreen();
                                    }));},
                              )
                              )
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
