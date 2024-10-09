import 'package:test/test.dart';

abstract class AbstractMapTest {
  Map<int, int> createMap();

  void runTests() {
    group('Map Tests', () {
      test('should add key-value pairs', () {
        final map = createMap();
        map[1] = 1;
        expect(map[1], 1);
      });

      test('should remove key-value pairs', () {
        final map = createMap();
        map[1] = 1;
        map.remove(1);
        expect(map.containsKey(1), isFalse);
      });

      test('should retrieve values by key', () {
        final map = createMap();
        map[1] = 1;
        expect(map[1], 1);
      });

      test('should return correct size', () {
        final map = createMap();
        map[1] = 1;
        map[2] = 2;
        expect(map.length, 2);
      });

      test('should return keys', () {
        final map = createMap();
        map[1] = 1;
        map[2] = 2;
        expect(map.keys.toList(), containsAllInOrder([1, 2]));
      });

      test('should return values', () {
        final map = createMap();
        map[1] = 1;
        map[2] = 2;
        expect(map.values.toList(), containsAllInOrder([1, 2]));
      });

      test('should update values for existing keys', () {
        final map = createMap();
        map[1] = 1;
        map[1] = 2;
        expect(map[1], 2);
      });

      test('should return null for non-existent key', () {
        final map = createMap();
        expect(map[999], isNull);
      });

      test('should replace value when adding duplicate key', () {
        final map = createMap();
        map[1] = 1;
        map[1] = 2;
        expect(map[1], 2);
      });

      test('should clear the map', () {
        final map = createMap();
        map[1] = 1;
        map.clear();
        expect(map.isEmpty, isTrue);
      });

      test('should iterate over entries correctly', () {
        final map = createMap();
        map[1] = 1;
        map[2] = 2;
        final entries = map.entries.toList();
        expect(entries.length, 2);
        expect(entries[0].key, 1);
        expect(entries[0].value, 1);
        expect(entries[1].key, 2);
        expect(entries[1].value, 2);
      });
    });
  }
}
