import 'package:flutter/material.dart';
import 'dart:math';

class TestNotification extends Notification {
  TestNotification({
    @required this.count,
  });

  final int count;
}

final GlobalKey key = GlobalKey();

final GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey<ScaffoldState>();

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationPageState();
  }
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldStateKey,
      appBar: AppBar(
        title: Text('Notification从下往上数据传递'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          NotificationListener(
              onNotification: (TestNotification n) {
                scaffoldStateKey.currentState
                    .showSnackBar(SnackBar(content: Text('随机数：${n.count}')));
                return true;
              },
              child: TestAPage(
                key: key,
              )),
        ],
      ),
    );
  }
}

class TestAPage extends StatefulWidget {
  TestAPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestAPageState();
  }
}

class _TestAPageState extends State<TestAPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: RaisedButton(
          textColor: Colors.black,
          child: Center(
            child: Text('点击传递随机数给上层Widget'),
          ),
          onPressed: () {
            TestNotification(count: Random().nextInt(100))
                .dispatch(key.currentContext);
          }),
    );
  }
}
