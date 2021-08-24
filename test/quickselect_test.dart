import 'package:quickselect/quickselect.dart';
import 'package:test/test.dart';

void main() {
  group('quicksort', () {
    test('selection', () {
      final arr = [65, 28, 59, 33, 21, 56, 22, 95, 50, 12, 90, 53, 28, 77, 39];
      quickselect(arr, 8);

      expect(
          arr,
          containsAllInOrder(
              [39, 28, 28, 33, 21, 12, 22, 50, 53, 56, 59, 65, 90, 77, 95]));
    });
  });
}
