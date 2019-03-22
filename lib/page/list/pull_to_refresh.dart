import 'package:flutter/material.dart';

class PullToRefresh extends StatefulWidget {
  @override
  _PullToRefreshState createState() {
    return _PullToRefreshState();
  }
}

class _PullToRefreshState extends State<PullToRefresh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PullToRefresh'),
      ),
      body: Container(
        child: Text('PullToRefresh'),
      ),
    );
  }
}
