import 'package:flutter/material.dart';
import 'package:redux_todolist/page/general_page.dart';

class AudioScreen extends StatefulWidget{
  @override
  _AudioScreenState createState() {
    // TODO: implement createState
    return _AudioScreenState();
  }
}

class _AudioScreenState extends State<AudioScreen>{
  Stopwatch stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "AudioScreen",
      child: Container(
        color: Colors.blue.withOpacity(0.2),
      ),
    );
  }

}