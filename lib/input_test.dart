import 'package:libserialport/libserialport.dart';

String getData() {
  String data = '';
  final port = SerialPort('/dev/ttyAMA0');
  if (!port.openRead()) {
    print("Error opening port");
    return ("0");
  }

  SerialPortReader reader = SerialPortReader(port);
  reader.stream.listen((input) {
    data = String.fromCharCodes(input);
  });
  return data;
}
