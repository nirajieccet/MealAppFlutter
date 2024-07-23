import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/test/counter.dart';

void main() {
  test('Counter Class test', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });
}