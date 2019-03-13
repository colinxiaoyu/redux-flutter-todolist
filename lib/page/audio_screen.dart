import 'package:flutter/material.dart';
import 'package:redux_todolist/page/general_page.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildRecordingStatus(),
            _buildTimerText(),
//            _buildButtonRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordingStatus() {
    return Container(
      height: 200.0,
      width: 200.0,
      child: Icon(Icons.surround_sound),
    );
  }

  Widget _buildTimerText() {
    List<String> timeList = const['00','00','00'];
    final TextStyle timerTextStyle = const TextStyle(
      fontSize: 30.0,
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w300,
      color: Colors.black87,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('${timeList[0]}:',style: timerTextStyle,),
        Text('${timeList[1]}:',style: timerTextStyle,),
        Text('${timeList[2]}',style: timerTextStyle,),
      ],
    );
  }

  Widget _buildButtonRow(BuildContext context) {}
}
