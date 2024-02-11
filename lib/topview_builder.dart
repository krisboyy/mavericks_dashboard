import 'package:flutter/material.dart';

class ScooterTopView extends StatefulWidget {
  final double ultrasonicData;
  const ScooterTopView({required this.ultrasonicData, super.key});

  @override
  State<ScooterTopView> createState() => _ScooterTopViewState();
}

class _ScooterTopViewState extends State<ScooterTopView> {
  String ultrasonicStatus() {
    String status = '';
    status = getCategory(widget.ultrasonicData);
    return status;
  }

  String getCategory(double value) {
    if (value > 0 && value < 100) {
      return 'close';
    } else if (value >= 100 && value < 200) {
      return 'okay';
    } else if (value >= 200 && value < 300) {
      return 'cool';
    } else if (value >= 300 || value == -1) {
      return 'out_of_range';
    } else {
      return ''; // Handle unexpected cases
    }
  }

  @override
  Widget build(BuildContext context) {
    //print("In topview builder, us data: ${widget.ultrasonicData}");
    String usStatus = ultrasonicStatus();
    String imagePath = 'assets/ultrasonic';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: 0.4 * screenWidth,
        height: 0.35 * screenHeight,
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              width: 0.25 * screenHeight,
              height: 0.25 * screenHeight,
              child: Image.asset(
                'assets/scooter_topview.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 0.05 * screenWidth,
                height: 0.05 * screenHeight,
                child: Image.asset(
                  '$imagePath/$usStatus.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ]),
          ],
        ));
  }
}
