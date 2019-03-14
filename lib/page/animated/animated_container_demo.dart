/**
 * AnimationContainer使用要点
 * 必须传入Duration告诉动画的播放时间
 * 当animationContainer接收到一个新的值的时候
 * 会根据老值进行补间动画
 * 例如开始宽高为100，然后给了新值0并setState后
 * AnimationContainer会让宽高从100逐渐变化到0
 * 其中变化曲线由Curve决定，默认为Curves.linear
 */
import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() {
    return _AnimatedContainerDemoState();
  }
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double _value = 250.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainerDemo'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() {
                _value = _value == 250.00 ? 80.00 : 250.00;
              }),
          child: AnimatedContainer(
              width: _value,
              height: _value,
              curve: Curves.bounceIn,
              child: FlutterLogo(),
              duration: Duration(seconds: 1)),
        ),
      ),
    );
  }
}
