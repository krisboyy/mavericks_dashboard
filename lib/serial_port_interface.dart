import 'package:dart_periphery/dart_periphery.dart';

List<double> getSerialData() {
  var s = Serial('/dev/ttyAMA0', Baudrate.b9600);
  List<String> rawData = [];
  List<double> data = [];
  try {
    var event = s.read(256, 100);
    String input = event.toString();
    rawData = input.split(',');
    if (rawData.length == 5) {
      // Try parsing each element to double
      data = rawData.map((e) => double.tryParse(e) ?? 0.0).toList();

      // Check if the parsed values fall within expected ranges
      if (checkDataRanges(data)) {
        //print("Data is valid: $data");
        data.add(1);
      } else {
        //print("Invalid data: $data");
        data.add(0);
      }
    } else {
      print("Invalid data length: $rawData");
      data = List.filled(6, 0);
    }
  } finally {
    s.dispose();
  }

  return data;
}

bool checkDataRanges(List<double> data) {
  // Define the expected ranges for each variable
  List<Range> expectedRanges = [
    Range(0, 40), // Speed
    Range(0, 100), // Battery Percentage
    Range(0, 50), // Range
    Range(0, 50), // Temp
    Range(-1, 300), // US
  ];

  if (data.length != expectedRanges.length) {
    return false;
  }

  for (int i = 0; i < data.length; i++) {
    if (!(expectedRanges[i].min <= data[i] && data[i] <= expectedRanges[i].max)) {
      return false;
    }
  }

  return true;
}

class Range {
  final double min;
  final double max;

  Range(this.min, this.max);
}
