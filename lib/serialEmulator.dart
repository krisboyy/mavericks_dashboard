import 'dart:math';

List<String> main() {
  // Seed the random number generator with the current time
  Random random = Random(DateTime.now().millisecondsSinceEpoch);
  String data = '';
  int value1 = random.nextInt(39) + 1;
  int value2 = random.nextInt(2);
  int value3 = random.nextInt(100) + 1;
  int value4 = random.nextInt(20) + 1;
  int value5 = random.nextInt(30) + 21;
  int value6 = random.nextInt(30) + 21;
  int value7 = random.nextInt(109) + 21;
  int value8 = random.nextInt(300) + 1;
  int value9 = random.nextInt(300) + 1;
  int value10 = random.nextInt(300) + 1;
  int value11 = random.nextInt(300) + 1;
  int value12 = random.nextInt(300) + 1;
  int value13 = random.nextInt(300) + 1;
  data = '$value1,$value2,$value3,$value4,$value5,$value6,$value7,$value8,$value9,$value10,$value11,$value12,$value13';
  List<String> input = data.split(',');
  print(input);
  return input;
}
