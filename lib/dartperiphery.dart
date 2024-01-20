import 'package:dart_periphery/dart_periphery.dart';

List<String> getSerialData() {
  var s = Serial('/dev/ttyAMA0', Baudrate.b9600);
  List<String> data = [];
  try {
    var event = s.read(256, 100);
    String input = event.toString();
    data = input.split(',');
  } finally {
    s.dispose();
  }

  return data;
}
