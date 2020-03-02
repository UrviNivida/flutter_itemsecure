
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TextStyle headStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Quicksand',
    color: Colors.black);
TextStyle titlestyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Quicksand',
    color: Colors.black54);
TextStyle timestyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Quicksand',
    color: Colors.black26);


class chat_screen extends StatefulWidget {
  final String name, formattedDate;

  chat_screen({this.name, this.formattedDate});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<chat_screen>
    with TickerProviderStateMixin {


  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool isType = false;
  var _padding = 5.0;

  void _handleSubmit(String text) {
    DateTime now = DateTime.now();
    String formattedDate1 = DateFormat('kk:mm').format(now);
    ChatMessage message = new ChatMessage(
        text: text,
        animationController: new AnimationController(
            duration: new Duration(seconds: 1), vsync: this),
        name: widget.name,
        formattedDate: formattedDate1);
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  Widget _buildText() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: const Color(0xFFF2F3F4),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _textController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          hintText: 'Type a message',
                          border: InputBorder.none,
                          hintStyle: timestyle,
                          labelStyle: titlestyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () {
              _handleSubmit(_textController.text);

              _textController.clear();
            },
            child: CircleAvatar(
              child: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;

    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: new IconButton(
          icon: new Icon(Icons.cancel, color: Colors.black), onPressed: () {Navigator.of(context).pop(true);},
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: new Text(
          widget.name,
          style: headStyle,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(_padding),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/sample.png'),
              minRadius: 23,
              maxRadius: 23,
            ),
          )
        ],
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
      ),
      body: new Container(
        width: screenWidth,
        height: screenHeight,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: ExactAssetImage('images/chatimage.png'),
            )),
        //color: Colors.teal.withAlpha(64),
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                //itemBuilder: (context, int index) => _messages[index],
                itemBuilder: (context, int index) {
                  return _messages[index];
                },
                itemCount: _messages.length,
              ),
            ),
            new Divider(
              height: 1.0,
            ),
            new Container(
              child: _buildText(),
            )
          ],
        ),
      ),
    );
  }
}

Widget getBodylayout(
    BuildContext context, int type, String text, String formattedDate) {
  double pixelRatio = MediaQuery.of(context).devicePixelRatio;
  double px = 1 / pixelRatio;

  BubbleStyle styleSomebody = BubbleStyle(
    nip: BubbleNip.leftTop,
    color: Colors.white,
    elevation: 1 * px,
    margin: BubbleEdges.only(top: 8.0, right: 50.0),
    alignment: Alignment.topLeft,
  );
  BubbleStyle styleMe = BubbleStyle(
    nip: BubbleNip.rightTop,
    color: Color.fromARGB(255, 225, 255, 199),
    elevation: 1 * px,
    margin: BubbleEdges.only(top: 8.0, left: 50.0),
    alignment: Alignment.topRight,
  );

  if (type == 1) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      //color: Colors.teal.withAlpha(64),
      child: Bubble(
          style: styleSomebody,
          child: Column(
            children: <Widget>[
//              Container(
//                alignment: Alignment.topLeft,
//                child: Text('Elison',
//                    style:
//                        TextStyle(fontStyle: FontStyle.normal, fontSize: 16.0),
//                    textAlign: TextAlign.left),
//              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(text, textAlign: TextAlign.left,style: titlestyle,),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  formattedDate,
                  style: TextStyle(fontSize: 10.0, color: Colors.black26),
                ),
              )
            ],
          )),
    );
  } else {
    return Container(
      //color: Colors.teal.withAlpha(64),
      child: Bubble(
          style: styleMe,
          child: Column(
            children: <Widget>[
//              Container(
//                alignment: Alignment.topLeft,
//                child: Text('Khushali',
//                    style: TextStyle(
//                        color: Colors.blue,
//                        fontStyle: FontStyle.normal,
//                        fontSize: 16.0),
//                    textAlign: TextAlign.left),
//              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black38),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  formattedDate,
                  style: TextStyle(fontSize: 10.0, color: Colors.black26),
                ),
              )
            ],
          )),
    );
  }
}

//this class will display chat message
class ChatMessage extends StatelessWidget {
  final String name, formattedDate;
  final AnimationController animationController;
  final String text;
  ChatMessage(
      {this.name, this.animationController, this.text, this.formattedDate});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      child: getBodylayout(context, 1, text, formattedDate),
    );
  }
}
