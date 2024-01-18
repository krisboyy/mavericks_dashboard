import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mavericks_dashboard/input_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    getAvailablePorts();
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
                  Image.asset("assets/icons/indicator_left_off.png"),
                  SizedBox(
                    width: 0.5 * screenWidth,
                    child: const Center(
                      child: Text(
                        "Please wear your seatbelt!",
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Image.asset("assets/icons/indicator_right_off.png")
                ],
              ),
              SizedBox(
                height: 0.05 * screenWidth,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/compass.png',
                    width: 0.35 * screenHeight,
                  ),
                  Image.asset(
                    'assets/speedometer.png',
                    height: 0.55 * screenHeight,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 0.35 * screenHeight,
                    child: Image.asset(
                      'assets/car_topview.png',
                      fit: BoxFit.fill,
                      //width: 0.20 * screenHeight,
                      //height: 0.31 * screenHeight,
                    ),
                  )
                ],
              ),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "[",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
                Text(
                  "D",
                  style: TextStyle(
                    color: Color(0xFF0BE2FF),
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
                Text(
                  "]",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/seatbelt_off.png",
                    height: 0.09 * screenHeight,
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    "assets/icons/temperature_high.png",
                    height: 0.09 * screenHeight,
                  ),
                  const SizedBox(width: 40),
                  const Text(
                    '69420\nkm',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
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
