
import 'dart:math';

import 'package:flutter/material.dart';

class RandomColor {
  static final Random _random =  Random();

  /// Returns a random color.
  static Color next() {
    return  Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}

/// A Container Widget that takes up a given [width] and [height] and paints itself with a
/// random color.

class RandomContainer extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final bool changeOnRedraw;

  RandomContainer(
      {this.width, this.height, this.child, this.changeOnRedraw = true});

  @override
  _RandomContainerState createState() =>  _RandomContainerState();
}

class _RandomContainerState extends State<RandomContainer> {
  Color randomColor;

  @override
  void initState() {
    super.initState();

    randomColor = RandomColor.next();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: widget.width,
      height: widget.height,
      color: widget.changeOnRedraw == true ? RandomColor.next() : randomColor,
      child: widget.child,
    );
  }
}
