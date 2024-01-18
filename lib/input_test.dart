import 'dart:io';
import 'package:libserialport/libserialport.dart';

void getAvailablePorts() {
  List<String> availablePorts = SerialPort.availablePorts;
  print("The available ports are: $availablePorts");
}
