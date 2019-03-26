import 'package:flutter/material.dart';

class AirPlayScreen extends StatefulWidget {
  @override
  _AirPlayScreenState createState() => _AirPlayScreenState();
}

class _AirPlayScreenState extends State<AirPlayScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AirPlayScreen'),
      ),
      body:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'You have pushed the button this many times:',
            ),
             Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child:  Icon(Icons.add),
      ),
    );
  }
}
