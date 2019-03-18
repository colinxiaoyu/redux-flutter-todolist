import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux_todolist/page/example/general_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() {
    // TODO: implement createState
    return _AudioScreenState();
  }
}

class _AudioScreenState extends State<AudioScreen> {
  Stopwatch stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "AudioScreen",
      child: Container(
        color: Colors.blue.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildRecordingStatus(),
            _buildTimerText(),
            _buildButtonRow(context),
          ],
        ),
      ),
    );
  }

  void _stopButtonPressed() {
    setState(() {
      stopwatch
        ..stop()
        ..reset();
    });
  }

  void _rightButtonPressed() {
    if (stopwatch.isRunning) {
      setState(() {
        stopwatch
          ..stop();
      });
    } else {
      setState(() {
        stopwatch
          ..start();
      });
    }
  }

  Widget _buildRecordingStatus() {
    return Container(
      height: 200.0,
      width: 200.0,
      child: stopwatch.isRunning?SpinKitWave(
          color: Colors.black87.withOpacity(0.7),
          type: SpinKitWaveType.start): Icon(Icons.surround_sound, size: 200.0,),
    );
  }

  Widget _buildTimerText() {
    return TimerText(stopwatch: stopwatch,);
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButton(_stopButtonPressed, context, Colors.red, Icons.stop),
        _buildButton(
            _rightButtonPressed, context, Colors.blue, stopwatch.isRunning?Icons.stop:Icons.play_arrow),

      ],
    );
  }

  Widget _buildButton(VoidCallback callBack, BuildContext context, Color color,
      IconData data) {
    return RaisedButton(
      onPressed: () {
        callBack();
      },
      color: color,
      child: Icon(data, color: Colors.white,),
      shape: StadiumBorder(),
    );
  }
}

class TimerText extends StatefulWidget {
  final Stopwatch stopwatch;

  const TimerText({ this.stopwatch});

  @override
  _TimerTextState createState() {
    // TODO: implement createState
    return _TimerTextState(stopwatch);
  }
}

class _TimerTextState extends State<TimerText> {

  final Stopwatch stopwatch;
  Timer timer;

  _TimerTextState(this.stopwatch) {
    timer = Timer.periodic(Duration(milliseconds: 30), _callBack);
  }

  _callBack(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> formattedTime =
    TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
    final TextStyle timerTextStyle = const TextStyle(
      fontSize: 30.0,
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w300,
      color: Colors.black87,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('${formattedTime[0]}：', style: timerTextStyle,),
        Text('${formattedTime[1]}：', style: timerTextStyle,),
        Text('${formattedTime[2]}', style: timerTextStyle,),
      ],
    );
  }
}

class TimerTextFormatter {
  static List<String> format(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (milliseconds % 100).toString().padLeft(2, '0');

    return [minutesStr, secondsStr, hundredsStr];
//    return "$minutesStr:$secondsStr:$hundredsStr";
  }
}


