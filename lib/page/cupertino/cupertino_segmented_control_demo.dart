import 'package:flutter/cupertino.dart';

class SegmentedControlDemo extends StatefulWidget {
  @override
  _SegmentedControlDemoState createState() => _SegmentedControlDemoState();
}

class _SegmentedControlDemoState extends State<SegmentedControlDemo> {
  Map<String,Widget> selectMap;
  String _select;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TextStyle textStyle = TextStyle(fontSize: 14.0,decoration: TextDecoration.none);
  selectMap = Map();
  selectMap["map"] = Text('Map',style: textStyle);
  selectMap["transit"] = Text('Transit',style: textStyle);
  selectMap['satellite'] = Text('Satellite',style: textStyle);
  _select = "map";
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('SegmentedControlDemo'),
      ),
        child: Center(
          child: Container(
            width: width,
            height: height/4,
            child: CupertinoSegmentedControl(
                children: selectMap,
                groupValue: _select,
                onValueChanged: (String key){
                  setState(() {
                    _select = key;
                  });
                }),
          ),
        ));
  }
}
