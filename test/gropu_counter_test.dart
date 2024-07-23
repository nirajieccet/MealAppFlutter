import 'package:flutter_test/flutter_test.dart';
import 'package:meal_app/test/counter.dart';

void main() {
  group('In this there is multiple test cases will run at the same time', () {

    test('Counter value should be start with 0', () {
      final counter = Counter();
      expect(counter.value, 0);
    });

    test('Counter value should be increment', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('Counter value should be decrement', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}