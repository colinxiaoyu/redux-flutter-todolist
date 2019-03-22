import 'package:flutter/cupertino.dart';

class NavigationBarDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Text('Leading'),
//          previousPageTitle: "previousPageTitle",
          middle: Text('middle'),
          trailing: Icon(CupertinoIcons.search),
        ),
        child: Container(
        ));
  }
}
