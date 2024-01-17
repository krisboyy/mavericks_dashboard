import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class Speedometer extends StatefulWidget {
  //final double speed;
  //const Speedometer({super.key, required speed});

  @override
  State<Speedometer> createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // return const AnimatedRadialGauge(
    //   duration: Duration(milliseconds: 500),
    //   value: widget.speed,
    // );
  }
}
