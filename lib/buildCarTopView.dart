import 'package:flutter/material.dart';

class CarTopView extends StatefulWidget {
  const CarTopView({super.key});

  @override
  State<CarTopView> createState() => _CarTopViewState();
}

class _CarTopViewState extends State<CarTopView> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: 0.4 * screenWidth,
        height: 0.35 * screenHeight,
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(children: [
              SizedBox(
                width: 0.06 * screenWidth,
              ),
              SizedBox(
                width: 0.05 * screenWidth,
                height: 0.05 * screenHeight,
                child: Image.asset(
                  'assets/ultrasonic/cool/fl.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                width: 0.05 * screenWidth,
                height: 0.05 * screenHeight,
                child: Image.asset(
                  'assets/ultrasonic/cool/fr.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                width: 0.05 * screenWidth,
              ),
            ]),
            Row(
              children: [
                SizedBox(
                  height: 0.15 * screenHeight,
                  width: 0.04 * screenWidth,
                  child: Image.asset(
                    'assets/ultrasonic/cool/l.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  width: 0.25 * screenHeight,
                  height: 0.25 * screenHeight,
                  child: Image.asset(
                    'assets/car_topview.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: 0.15 * screenHeight,
                  width: 0.04 * screenWidth,
                  child: Image.asset(
                    'assets/ultrasonic/cool/r.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
            Row(children: [
              SizedBox(
                width: 0.06 * screenWidth,
              ),
              SizedBox(
                width: 0.05 * screenWidth,
                height: 0.05 * screenHeight,
                child: Image.asset(
                  'assets/ultrasonic/cool/rl.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                width: 0.05 * screenWidth,
                height: 0.05 * screenHeight,
                child: Image.asset(
                  'assets/ultrasonic/cool/rr.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                width: 0.05 * screenWidth,
              ),
            ]),
          ],
        ));
  }
}
