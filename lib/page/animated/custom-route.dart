/**
 * 通过自定义transitionsBuilder实现路由过渡动画
 *
 * 请切换不同注释分别查看
 */
import 'package:flutter/material.dart';

class CustomRouteFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'FirstPage',
          style: TextStyle(fontSize: 36.0),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
            child: Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 64.0,
            ),
            onPressed: () =>
                Navigator.of(context).push(
                    CustomRoute(CustomRouteSecondPage()))),
      ),
    );
  }
}

class CustomRouteSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('SecondPage',style: TextStyle(fontSize: 36.0),),
        backgroundColor: Colors.pinkAccent,
        leading: Container(),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
            child: Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 64.0,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
    );
  }
}


class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  CustomRoute(this.widget)
      : super(
    transitionDuration: const Duration(seconds: 2),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      //淡出过渡路由
      return FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animation, curve: Curves.fastOutSlowIn)),
        child: child,
      );

      //比例转换路由
//          return ScaleTransition(
//            scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                parent: animation, curve: Curves.fastOutSlowIn)),
//            child: child,
//            );

      //旋转+比例转换路由
//            return RotationTransition(
//              turns: Tween(begin: -1.0, end: 1.0).animate(CurvedAnimation(
//                  parent: animation, curve: Curves.fastOutSlowIn)),
//              child: ScaleTransition(
//                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                    parent: animation, curve: Curves.fastOutSlowIn)),
//                child: child,
//              ),
//            );

      //幻灯片路由
//            return SlideTransition(
//              position:
//                  Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
//                      .animate(CurvedAnimation(
//                          parent: animation, curve: Curves.fastOutSlowIn)),
//              child: child,
//            );
    },
  );
}
