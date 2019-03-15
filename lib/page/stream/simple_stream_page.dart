import 'package:flutter/material.dart';
import 'dart:async';

/// 为什么要使用 StatefulWidget ，因为_controller 需要销毁，不然会有警告
class SimpleStreamPage extends StatefulWidget {
  @override
  _SimpleStreamPageState createState() {
    return _SimpleStreamPageState();
  }
}

class _SimpleStreamPageState extends State<SimpleStreamPage> {
  StreamController _controller;

  int count;

  @override
  void initState() {
    _controller = StreamController();
    count = 0;
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleStreamPage'),
      ),
      body: Center(
          child: StreamBuilder(
              initialData: count,
              stream: _controller.stream,
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.sink.add(count++);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
