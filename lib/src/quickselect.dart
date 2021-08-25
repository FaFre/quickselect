import 'dart:math' as math;

import 'package:collection/collection.dart';

typedef compareTo<E> = int Function(E a, E b);

void quickselect<E>(List<E> arr, int k,
    {int? left, int? right, compareTo<E>? compare}) {
  _quickselectStep(
      arr,
      k,
      left ?? 0,
      right ?? (arr.length - 1),
      compare ??
          (E a, E b) => Comparable.compare(a as Comparable, b as Comparable));
}

void _quickselectStep<E>(
    List<E> arr, int k, int left, int right, compareTo<E> compare) {
  while (right > left) {
    if (right - left > 600) {
      final n = right - left + 1;
      final m = k - left + 1;
      final z = math.log(n);
      final s = 0.5 * math.exp(2 * z / 3);
      final sd =
          0.5 * math.sqrt(z * s * (n - s) / n) * (m - n / 2 < 0 ? -1 : 1);
      final newLeft = math.max(left, (k - m * s / n + sd).floor());
      final newRight = math.min(right, (k + (n - m) * s / n + sd).floor());

      _quickselectStep(arr, k, newLeft, newRight, compare);
    }

    final t = arr[k];
    var i = left;
    var j = right;

    arr.swap(left, k);
    if (compare(arr[right], t) > 0) arr.swap(left, right);

    while (i < j) {
      arr.swap(i, j);
      i++;
      j--;
      while (compare(arr[i], t) < 0) {
        i++;
      }
      while (compare(arr[j], t) > 0) {
        j--;
      }
    }

    if (compare(arr[left], t) == 0) {
      arr.swap(left, j);
    } else {
      j++;
      arr.swap(j, right);
    }

    if (j <= k) left = j + 1;
    if (k <= j) right = j - 1;
  }
}
