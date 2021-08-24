import 'dart:math';

import 'package:quickselect/quickselect.dart';

void main() {
  const N = 10000000;
  final random = Random();
  final arr = List.generate(N, (_) => random.nextInt(1 << 32), growable: false);

  final s = Stopwatch()..start();

  quickselect(arr, N ~/ 2, left: 0, right: N - 1);

  s.stop();
  print('quickselect took ${s.elapsedMilliseconds}');
}
