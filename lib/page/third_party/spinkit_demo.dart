import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinkit extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color _color = Colors.blue;

    return Scaffold(

      appBar: AppBar(
        title: Text("SpinKit", style: TextStyle(fontSize: 24.0)),
      ),
      body: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRotatingCircle(color: _color),
                SpinKitRotatingPlain(color: _color),
                SpinKitChasingDots(color: _color),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPumpingHeart(color: _color),
                SpinKitPulse(color: _color),
                SpinKitDoubleBounce(color: _color),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitWave(color: _color, type: SpinKitWaveType.start),
                SpinKitWave(color: _color, type: SpinKitWaveType.center),
                SpinKitWave(color: _color, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitThreeBounce(color: _color),
                SpinKitWanderingCubes(color: _color),
                SpinKitWanderingCubes(
                    color: _color, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitCircle(color: _color),
                SpinKitFadingFour(color: _color),
                SpinKitFadingFour(
                    color: _color, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingCube(color: _color),
                SpinKitCubeGrid(size: 51.0, color: _color),
                SpinKitFoldingCube(color: _color),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRing(color: _color),
                SpinKitDualRing(color: _color),
                SpinKitRipple(color: _color),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingGrid(color: _color),
                SpinKitFadingGrid(
                    color: _color, shape: BoxShape.rectangle),
                SpinKitHourGlass(color: _color),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitSpinningCircle(color: _color),
                SpinKitSpinningCircle(
                    color: _color, shape: BoxShape.rectangle),
                SpinKitFadingCircle(color: _color),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPouringHourglass(color: _color),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}
