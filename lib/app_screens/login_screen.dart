import 'package:flutter/material.dart';

import 'Dashbaroadscreen.dart';
import 'FadeAnimation.dart';

class Loginscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Loginscreennew();
  }
}

class Loginscreennew extends State<Loginscreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email, _passwaord;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
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
                  FadeAnimation(
                      1.2,
                      Text("Welcome Back",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))),
                  FadeAnimation(
                      1.6,
                      Text("Login to ItemSecure",
                          style: TextStyle(color: Colors.white, fontSize: 18)))
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
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: Offset(0, 3))
                                    ]),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFFF8C300)))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email Address / Mobile No.",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              )),
                          SizedBox(height: 10),
                          FadeAnimation(
                              1.9,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: Offset(0, 3))
                                    ]),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFFF8C300)))),
//                                  child: TextField(
//                                    obscureText: true,
//                                    decoration: InputDecoration(
//                                        hintText: "Password",
//                                        hintStyle:
//                                            TextStyle(color: Colors.grey),
//                                        border: InputBorder.none),
//                                  ),
                                  child: TextFormField(
                                      autofocus: false,
                                      obscureText: _obscureText,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
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
                                      ),
                                      onSaved: (String value) {}),
                                ),
                              )),
                          SizedBox(height: 30),
                          FadeAnimation(
                              2,
                              Text("Forget your password?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFFF8C300),
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: 40),
                          FadeAnimation(
                              2.2,
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        colors: [
                                          Color(0xFFF8C300),
                                          Color(0xFFFFEE58)
                                        ])),
                                child: Center(
                                    child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Dashbaroadscreen();
                                    }));
                                  },
                                  child: Text("Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                )),
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
