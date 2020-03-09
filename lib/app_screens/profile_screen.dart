//import 'dart:io';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//
//class UserOptions extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return new UserOptionsState();
//  }
//}
//
//class UserOptionsState extends State<UserOptions> {
////save the result of gallery file
//  File galleryFile;
//
////save the result of camera file
//  File cameraFile;
//
//  @override
//  Widget build(BuildContext context) {
//    //display image selected from gallery
//    imageSelectorGallery() async {
//      galleryFile = await ImagePicker.pickImage(
//        source: ImageSource.gallery,
//        // maxHeight: 50.0,
//        // maxWidth: 50.0,
//      );
//      print("You selected gallery image : " + galleryFile.path);
//      setState(() {});
//    }
//
//    //display image selected from camera
//    imageSelectorCamera() async {
//      cameraFile = await ImagePicker.pickImage(
//        source: ImageSource.camera,
//        //maxHeight: 50.0,
//        //maxWidth: 50.0,
//      );
//      print("You selected camera image : " + cameraFile.path);
//      setState(() {});
//    }
//
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Image Picker'),
//      ),
//      body: new Builder(
//        builder: (BuildContext context) {
//          return new Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              new RaisedButton(
//                child: new Text('Select Image from Gallery'),
//                onPressed: imageSelectorGallery,
//              ),
//              new RaisedButton(
//                child: new Text('Select Image from Camera'),
//                onPressed: imageSelectorCamera,
//              ),
//              displaySelectedFile(galleryFile),
//              displaySelectedFile(cameraFile)
//            ],
//          );
//        },
//      ),
//    );
//  }
//
//  Widget displaySelectedFile(File file) {
//    return new SizedBox(
//      height: 200.0,
//      width: 300.0,
////child: new Card(child: new Text(''+galleryFile.toString())),
////child: new Image.file(galleryFile),
//      child: file == null
//          ? new Text('Sorry nothing selected!!')
//          : new Image.file(file),
//    );
//  }
//}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_itemsecure_dsr/utils/ImagePickerHandler.dart';
import 'package:image_picker/image_picker.dart';

import 'dashboard_screen.dart';

class profile_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return profile_screenState();
  }
}

class profile_screenState extends State<profile_screen>
    with TickerProviderStateMixin, ImagePickerListener {
  File _image;
  AnimationController _controller;
  ImagePickerHandler imagePicker;
  TextStyle headStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Quicksand',
      color: Colors.black);

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker = new ImagePickerHandler(this, _controller);
    imagePicker.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//save the result of gallery file
  File galleryFile;

//save the result of camera file
//  File cameraFile;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
        color: Theme.of(context).primaryColor);
    TextStyle textStylevalue = TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Quicksand',
        color: Colors.black);

    //display image selected from gallery
    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected gallery image : " + galleryFile.path);
      setState(() {});
    }

    //display image selected from camera
    imageSelectorCamera() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        //maxHeight: 50.0,
        //maxWidth: 50.0,
      );
      print("You selected camera image : " + galleryFile.path);
      setState(() {});
    }

    Widget displaySelectedFile(File file) {
      return new SizedBox(
//        height: 200.0,
//        width: 300.0,
//child: new Card(child: new Text(''+galleryFile.toString())),
//child: new Image.file(galleryFile),
          child: file == null
              ? new Stack(
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        child: Container(
                          height: 120,
                          width: 120,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                        radius: 80.0,
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                    )
                  ],
                )
              : new Container(
                  height: 120.0,
                  width: 120.0,
                  child: Stack(
                    children: <Widget>[
//              Container(
//                decoration: new BoxDecoration(
//                  color: const Color(0xff7c94b6),
////                  image: new DecorationImage(
//////                    image: FileImage(File(file)),
//////                    image: new Image.file(file),
////                    fit: BoxFit.cover,
////
////                  ),
//                  border:
//                  Border.all(color: Colors.black54, width: 5.0),
//                  borderRadius:
//                  new BorderRadius.all(const Radius.circular(80.0)),
//                ),
////                child: new Image.file(file),
//              ),
                      Container(
                        decoration: new BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                          border: new Border.all(
                            color: Colors.grey,
                            width: 7,
                          ),
                        ),
                        child: new Center(
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child:  Stack(
                              children: <Widget>[
//                        SizedBox(
//                          height: 120,
//                        ),
                                Center(
                                  child: new Image.file(
                                    file,
                                    fit: BoxFit.contain,
//                                  width: 50,
//                                  height: 50,
                                  ),
//                          Image.asset('images/smile_fill.png'),
                                ),
//                        Text(
//                          "Create Project",
//                        ),
                              ],
                            ),
                          )


                        ),
                        height: 120,
                        width: 120,
                      ),
                      Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      )
                    ],
                  ),
                )
//        new Image.file(file),
          );
    }

//    setState(() {
////      print(cameraFile);
//      print(galleryFile);
//    });

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Your Profile",
            style: headStyle,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: ((BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                            title: Text(
                              "Choose Upload",
                              textAlign: TextAlign.center,
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: GestureDetector(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Icon(Icons.camera_alt),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Camera',
                                            style: textStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      imageSelectorCamera();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: GestureDetector(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Icon(Icons.photo),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Gallery',
                                            style: textStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      imageSelectorGallery();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: new Card(
                                    color: Colors.black,
                                    elevation: 5.0,
//          onPressed: null,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    )),
                                    child: Padding(
                                      child: Text('Cancel',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white)),
                                      padding: EdgeInsets.all(10.0),
                                    )),
                              )
                            ],
                          );
//                          return DynamicDialog();
                        }));
//                    imageSelectorGallery();
//                    print("You selected gallery image : dsssdddssd");
                  },
                  child: new Container(
                      height: 120,
                      child: Center(child: displaySelectedFile(galleryFile)))),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: new EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('First Name', style: textStyle),
                            )),
                        Expanded(
                          flex: 5,
                          child: Container(
                              child: Text("Khushali", style: textStylevalue)),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Last Name', style: textStyle),
                            )),
                        Expanded(
                          flex: 5,
                          child: Container(
                              child: Text("Thakkar", style: textStylevalue)),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Designation', style: textStyle),
                            )),
                        Expanded(
                            flex: 6,
                            child: Container(
                                child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text("Android", style: textStylevalue),
                                ],
                              ),
                              subtitle:
                                  Text("Developer", style: textStylevalue),
                            ))),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Role', style: textStyle),
                            )),
                        Expanded(
                          flex: 5,
                          child: Container(
                              child: Text("Admin", style: textStylevalue)),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Email Id', style: textStyle),
                            )),
                        Expanded(
                            flex: 5,
                            child: Container(
                              child: Text("k@gmail.com", style: textStylevalue),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text('Contact', style: textStyle),
                            )),
                        Expanded(
                            flex: 5,
                            child: Container(
                              child: Text("1234567890", style: textStylevalue),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1.0,
                      height: 15,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Theme.of(context).primaryColor
                                ])),
                        child: Center(
                          child: Text("Logout", style: headStyle),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DashbaroadScreen();
                        }));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }

  @override
  userImage(File _image) {
    // TODO: implement userImage
    return null;
  }
}

//class DynamicDialog extends StatefulWidget {
////  DynamicDialog({this.title});
////  final String title;
//  @override
//  _DynamicDialogState createState() => _DynamicDialogState();
//}
//
//class _DynamicDialogState extends State<DynamicDialog> {
//  String _title;
//
//  @override
//  void initState() {
////    _title = widget.title;
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    TextStyle hintStyleDropdown = TextStyle(
//        fontSize: 16.0,
//        fontWeight: FontWeight.w200,
//        fontFamily: 'Quicksand',
//        color: Theme.of(context).primaryColor);
//
//    TextStyle textStyle = TextStyle(
//        fontSize: 14.0,
//        fontWeight: FontWeight.w500,
//        fontFamily: 'Quicksand',
//        color: Colors.black);
//
//    TextStyle hintStyle = TextStyle(
//        fontSize: 14.0,
//        fontWeight: FontWeight.w200,
//        fontFamily: 'Quicksand',
//        color: Colors.grey[2]);
//
//    TextStyle labelStyle = TextStyle(
//        fontSize: 16.0,
//        fontWeight: FontWeight.w500,
//        fontFamily: 'Quicksand',
//        color: Colors.black);
//
//
//
//
//
//
//
//    return AlertDialog(
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.all(
//            Radius.circular(15),
//          )),
//      title: Text(
//        "Choose Upload",
//        textAlign: TextAlign.center,
//      ),
//      content: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.all(0.0),
//            child:
//            GestureDetector(
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    flex: 1,
//                    child: Icon(Icons.camera_alt),
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Text('Camera',style: textStyle,
//                    ),
//                  )
//                ],
//              ),
//              onTap: ()
//              {
//                imageSelectorCamera();
//
//              },
//            ),
//
//          ),
//          Padding(
//            padding: EdgeInsets.all(0.0),
//            child:
//            GestureDetector(
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    flex: 1,
//                    child: Icon(Icons.photo),
//                  ),
//                  Expanded(
//                    flex: 1,
//                    child: Text('Gallery',style: textStyle,
//                    ),
//                  )
//                ],
//              ),
//              onTap: ()
//              {
//imageSelectorGallery();
//              },
//            ),
//
//          ),
//        ],
//      ),
//      actions: <Widget>[
//        GestureDetector(
//          onTap: () => Navigator.pop(context),
//          child: new Card(
//              color: Colors.black,
//              elevation: 5.0,
////          onPressed: null,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.all(
//                    Radius.circular(10.0),
//                  )),
//              child: Padding(
//                child: Text('Cancel',
//                    style: TextStyle(fontSize: 14, color: Colors.white)),
//                padding: EdgeInsets.all(10.0),
//              )),
//        )
//      ],
//    );
//  }
//}
