import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HideBottomBarDemo extends StatefulWidget {
  @override
  _HideBottomBarDemoState createState() {
    return _HideBottomBarDemoState();
  }
}

class _HideBottomBarDemoState extends State<HideBottomBarDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  ScrollController _scrollController;

  void _judgeScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _animationController.forward();
    }
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _animationController.reverse();
    }
  }


  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(microseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: -100.00)
        .animate(
        CurvedAnimation(parent: _animationController,
            curve: Curves.fastOutSlowIn));
    _scrollController = ScrollController(keepScrollOffset: true)
    ..addListener(_judgeScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
