import 'package:flutter/material.dart';

class CarTopView extends StatefulWidget {
  List<double> ultrasonicData;
  CarTopView({required this.ultrasonicData, super.key});

  @override
  State<CarTopView> createState() => _CarTopViewState();
}

class _CarTopViewState extends State<CarTopView> {
  List<String> ultrasonicStatus() {
    List<String> status = [];
    for (double value in widget.ultrasonicData) {
      String category = getCategory(value);
      status.add(category);
    }
    return status;
  }

  String getCategory(double value) {
    if (value > 0 && value < 100) {
      return 'close';
    } else if (value >= 100 && value < 200) {
      return 'okay';
    } else if (value >= 200 && value < 300) {
      return 'cool';
    } else if (value >= 300) {
      return 'out_of_range';
    } else {
      return ''; // Handle unexpected cases
    }
  }

  @override
  Widget build(BuildContext context) {
    print("In topview builder, us data: ${widget.ultrasonicData}");
    List<String> usStatus = ultrasonicStatus();
    String imagePath = 'assets/ultrasonic';
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
                  '$imagePath/${usStatus[0]}/fl.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                width: 0.05 * screenWidth,
                height: 0.05 * screenHeight,
                child: Image.asset(
                  '$imagePath/${usStatus[1]}/fr.png',
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
                    '$imagePath/${usStatus[2]}/l.png',
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
                    '$imagePath/${usStatus[3]}/r.png',
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
                  '$imagePath/${usStatus[4]}/rl.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                width: 0.05 * screenWidth,
                height: 0.05 * screenHeight,
                child: Image.asset(
                  '$imagePath/${usStatus[5]}/rr.png',
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
