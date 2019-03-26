///**
/// * 实现原理，使用WillPopScope组件，它会检测到子组件的Navigation的pop事件，并拦截下来。
/// * 我们需要在它的onWillPop属性中返回一个新的组件（一般是一个Dialog）处理是否真的pop该页面。
/// */
import 'dart:async';

import 'package:flutter/material.dart';

class WillPopScopeDemo extends StatefulWidget {

  @override
  _WillPopScopeDemoState createState() =>  _WillPopScopeDemoState();
}

class _WillPopScopeDemoState extends State<WillPopScopeDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('WillPopScopeDemo'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'You have pushed the button this many times:',
              ),
              new Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you really want to exit the app?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ));
  }
}
