import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:mavericks_dashboard/buildCarTopView.dart';
import 'package:mavericks_dashboard/dartperiphery.dart';

void main() {
  runApp(const MavericksDashboard());
}

class MavericksDashboard extends StatelessWidget {
  const MavericksDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      title: 'Mavericks Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dashboard(title: 'Flutter Demo Home Page'),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});
  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> data = [
    '0',
    '0',
    '80',
    '15',
    '27',
    '27',
    '35',
    '450',
    '200',
    '150',
    '300',
    '300',
    '150'
  ];

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        data = getSerialData();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  //List<String> data = [Speed, Seatbelt, Battery, Range, Bat1Temp, Bat2Temp, MotTemp, USFl, USFR, USR, USBR, USBL, USL];
  //double data = 0;
  int tempChecker() {
    if (double.parse(data[4]) > 35 || double.parse(data[5]) > 35 || double.parse(data[6]) > 100) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(0.03 * screenHeight),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        exit((0));
                      },
                      icon: const Icon(Icons.close_sharp)),
                  //Image.asset("assets/icons/indicator_left_off.png"),
                  SizedBox(
                      width: 0.5 * screenWidth,
                      child: Center(
                          child: int.parse(data[1]) == 0
                              ? Text(
                                  "Please wear your seatbelt",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 0.05 * screenHeight,
                                    fontFamily: 'Barlow',
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )
                              : const SizedBox())),
                  //Image.asset("assets/icons/indicator_right_off.png")
                ],
              ),
              SizedBox(
                height: 0.025 * screenHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/compass.png',
                    width: 0.35 * screenHeight,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/speedometer.png',
                        height: 0.55 * screenHeight,
                      ),
                      AnimatedRadialGauge(
                        duration: const Duration(milliseconds: 500),
                        value: double.parse(data[0]),
                        initialValue: 0,
                        radius: 180,
                        curve: Curves.elasticOut,
                        axis: GaugeAxis(
                          min: 0,
                          max: 40,
                          degrees: 240,
                          progressBar: const GaugeProgressBar.basic(
                            color: Color(0x00FFFFFF),
                          ),
                          pointer: GaugePointer.triangle(
                            width: 0.025 * screenWidth,
                            height: 0.025 * screenWidth,
                            color: Color(0xFF0BE2FF),
                            position: GaugePointerPosition.surface(),
                          ),
                          style: const GaugeAxisStyle(
                            thickness: 0,
                          ),
                        ),
                      ),
                      Text(
                        data[0],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.35 * screenHeight,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 0.40 * screenHeight,
                    child: CarTopView(),
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "[",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.06 * screenHeight,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "D",
                  style: TextStyle(
                    color: Color(0xFF0BE2FF),
                    fontSize: 0.06 * screenHeight,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "]",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.06 * screenHeight,
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w900,
                  ),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  int.parse(data[1]) == 0
                      ? Image.asset(
                          "assets/icons/seatbelt_off.png",
                          height: 0.09 * screenHeight,
                        )
                      : Image.asset(
                          "assets/icons/seatbelt_on.png",
                          height: 0.09 * screenHeight,
                        ),
                  const SizedBox(width: 20),
                  tempChecker() == 0
                      ? Image.asset(
                          "assets/icons/temperature.png",
                          height: 0.09 * screenHeight,
                        )
                      : Image.asset(
                          "assets/icons/temperature_high.png",
                          height: 0.09 * screenHeight,
                        ),
                  const SizedBox(width: 40),
                  Text(
                    '69420\nkm',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 0.04 * screenHeight,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Image.asset(
                    "assets/icons/handbrake_on.png",
                    height: 0.09 * screenHeight,
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    "assets/icons/highbeam_on.png",
                    height: 0.09 * screenHeight,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
