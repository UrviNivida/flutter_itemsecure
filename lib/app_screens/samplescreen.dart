
import 'dart:async';
//import 'dart:html';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatchApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StopWatchAppState();
  }

}

class StopWatchAppState extends State<StopWatchApp>
{
  bool startispressed=true;
  bool stopispressed=true;
  bool resetispressed=true;
  String stoptimetodisplay = "00:00:00";
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);
  void starttimer()
  {
    Timer(dur,keeprunning);
  }

  void keeprunning() {

    if(swatch.isRunning)
    {
      starttimer();
//        Timer(dur,keeprunning);
    }
    setState(() {
      stoptimetodisplay =swatch.elapsed.inHours.toString().padLeft(2,"0") + ":"
          + (swatch.elapsed.inMinutes%60).toString().padLeft(2,"0") + ":"
          + (swatch.elapsed.inSeconds%60).toString().padLeft(2,"0");
    });
  }




  void startstopwatch()
  {
    setState(() {
      stopispressed=false;
      startispressed=false;
    });
    swatch.start();
    starttimer();
//      Timer(dur,keeprunning);
  }

  void stopsstopwatch()
  {

    setState(() {
      stopispressed=true;
      resetispressed=false;
      startispressed=true;
    });
    swatch.stop();
  }

  void resetwatch()
  {

    setState(() {
      startispressed=true;
      resetispressed=true;
    });
    swatch.reset();
    stoptimetodisplay="00:00:00";
  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Container(
       child: Column(
         children: <Widget>[
           Expanded(
             flex: 6,
             child: Container(
               alignment: Alignment.center,
               child: Text(stoptimetodisplay,style: TextStyle(
                 fontSize: 50.0,
                 fontWeight: FontWeight.w700
               ),),
             ),
           ),
           Expanded(
             flex: 4,
             child: Container(
               child: Column(
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       RaisedButton(
                         onPressed: stopispressed ? null : stopsstopwatch,
                         color: Colors.red,
                         padding: EdgeInsets.symmetric(
                           horizontal: 40.0,vertical: 15.0
                         ),child: Text(
                         'Stop',style: TextStyle(
                         fontSize: 20.0,
                         color: Colors.white
                       ),
                       ),
                       ),
                       RaisedButton(
                         onPressed: resetispressed ? null : resetwatch,
                         color: Colors.green,
                         padding: EdgeInsets.symmetric(
                             horizontal: 40.0,vertical: 15.0
                         ),child: Text(
                         'Reset',style: TextStyle(
                           fontSize: 20.0,
                           color: Colors.white
                       ),
                       ),
                       ),
                     ],
                   ),
                   RaisedButton(
                     onPressed: startispressed ? startstopwatch : null,
                     color: Colors.blue,
                     padding: EdgeInsets.symmetric(
                         horizontal: 40.0,vertical: 15.0
                     ),child: Text(
                     'Start',style: TextStyle(
                       fontSize: 20.0,
                       color: Colors.white
                   ),
                   ),
                   ),
                 ],
               ),
             ),
           )
         ],
       ),
    );
  }

}


//import 'dart:async';
//
//import 'package:fl_chart/fl_chart.dart';
//import 'package:flutter/material.dart';
//
//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    var timerService = TimerService.of(context);
//    return Scaffold(
//      appBar: AppBar(),
//      body: Center(
//        child: AnimatedBuilder(
//          animation: timerService, // listen to ChangeNotifier
//          builder: (context, child) {
//            // this part is rebuilt whenever notifyListeners() is called
//            return Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text('Elapsed: ${timerService.currentDuration}'),
//                RaisedButton(
//                  onPressed: !timerService.isRunning ? timerService.start : timerService.stop,
//                  child: Text(!timerService.isRunning ? 'Start' : 'Stop'),
//                ),
//                RaisedButton(
//                  onPressed: timerService.reset,
//                  child: Text('Reset'),
//                )
//              ],
//            );
//          },
//        ),
//      ),
//    );
//  }
//}
//
//class TimerService extends ChangeNotifier {
//  Stopwatch _watch;
//  Timer _timer;
//
//  Duration get currentDuration => _currentDuration;
//  Duration _currentDuration = Duration.zero;
//
//  bool get isRunning => _timer != null;
//
//  TimerService() {
//    _watch = Stopwatch();
//  }
//
//  void _onTick(Timer timer) {
//    _currentDuration = _watch.elapsed;
//
//    // notify all listening widgets
//    notifyListeners();
//  }
//
//  void start() {
//    if (_timer != null) return;
//
//    _timer = Timer.periodic(Duration(seconds: 1), _onTick);
//    _watch.start();
//
//    notifyListeners();
//  }
//
//  void stop() {
//    _timer?.cancel();
//    _timer = null;
//    _watch.stop();
//    _currentDuration = _watch.elapsed;
//
//    notifyListeners();
//  }
//
//  void reset() {
//    stop();
//    _watch.reset();
//    _currentDuration = Duration.zero;
//
//    notifyListeners();
//  }
//
//  static TimerService of(BuildContext context) {
//    var provider = context.inheritFromWidgetOfExactType(TimerServiceProvider) as TimerServiceProvider;
//    return provider.service;
//  }
//}
//
//class TimerServiceProvider extends InheritedWidget {
//  const TimerServiceProvider({Key key, this.service, Widget child}) : super(key: key, child: child);
//
//  final TimerService service;
//
//  @override
//  bool updateShouldNotify(TimerServiceProvider old) => service != old.service;
//}
//
