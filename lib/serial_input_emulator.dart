import 'dart:math';

List<double> main() {
  // Seed the random number generator with the current time
  Random random = Random(DateTime.now().millisecondsSinceEpoch);
  String input = '';
  int value1 = random.nextInt(39) + 1;
  int value2 = random.nextInt(100) + 1;
  int value3 = random.nextInt(20) + 1;
  int value4 = random.nextInt(30) + 21;
  int value5 = random.nextInt(300) + 1;
  int value6 = 1;
  input = '$value1,$value2,$value3,$value4,$value5,$value6';
  List<String> rawData = input.split(',');
  List<double> data = rawData.map((e) => double.parse(e)).toList();
  return data;
}
