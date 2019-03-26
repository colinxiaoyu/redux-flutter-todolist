import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  @override
  _WrapDemoState createState() {
    return _WrapDemoState();
  }
}

class _WrapDemoState extends State<WrapDemo> {
  List<Widget> list;

  @override
  void initState() {
    list = List<Widget>()..add(_buildAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('WarpDemo'),
      ),
      body: Center(
        child: Container(
          height: height / 2,
          width: width,
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: list,
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (list.length < 9) {
          list.insert(list.length - 1, _buildPhoto(list.length - 1));
          setState(() {});
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        color: Colors.blueGrey,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildPhoto(int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        color: Colors.blueGrey,
        child: Text('Photo $index'),
      ),
    );
  }
}
