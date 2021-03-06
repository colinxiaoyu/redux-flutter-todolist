import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerDemo extends StatefulWidget {
  @override
  _PickerDemoState createState() => _PickerDemoState();
}

class _PickerDemoState extends State<PickerDemo> {
  FixedExtentScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FixedExtentScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('PickerDemo'),
        ),
        child: Container(
          child: Container(
            child: CupertinoPicker(
              scrollController: _controller,
              itemExtent: 60.0,
              backgroundColor: CupertinoColors.white,
              onSelectedItemChanged: (int index) {},
              children: [
                Text('Test1',style: TextStyle(decoration: TextDecoration.none),),
                Text('Test2'),
                Text('Test3'),
                Text('Test4'),
                Text('Test5'),
                Text('Test6'),
              ],
            ),
          ),
        ));
  }
}
