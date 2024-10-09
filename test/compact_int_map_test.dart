import 'package:compact_int_map/compact_int_map.dart';
import 'package:test/test.dart';

void main() {
  group('CompactIntMap Tests', () {
    test('Initialization', () {
      final map = CompactIntMap();
      expect(map.size(), equals(0));
    });

    test('Put and Get', () {
      final map = CompactIntMap();
      map.put(1, 100);
      expect(map.get(1), equals(100));
      expect(map.get(2), equals(null));
    });

    test('GetOrDefault', () {
      final map = CompactIntMap();
      map.put(1, 100);
      expect(map.getOrDefault(1, -1), equals(100));
      expect(map.getOrDefault(2, -1), equals(-1));
    });

    test('Update existing value', () {
      final map = CompactIntMap();
      map.put(1, 100);
      map.put(1, 200);
      expect(map.get(1), equals(200));
    });

    test('Remove key', () {
      final map = CompactIntMap();
      map.put(1, 100);
      map.remove(1);
      expect(map.get(1), equals(null));
    });

    test('Clear map', () {
      final map = CompactIntMap();
      map.put(1, 100);
      map.clear();
      expect(map.size(), equals(0));
    });

    test('Index of key', () {
      final map = CompactIntMap();
      map.put(1, 100);
      expect(map.indexOfKey(1), equals(0));
      expect(map.indexOfKey(2), lessThan(0));
    });

    test('Index of value', () {
      final map = CompactIntMap();
      map.put(1, 100);
      expect(map.indexOfValue(100), equals(0));
      expect(map.indexOfValue(200), equals(-1));
    });

    test('Append method', () {
      final map = CompactIntMap();
      map.append(1, 100);
      expect(map.get(1), equals(100));

      map.append(2, 200);
      expect(map.get(2), equals(200));

      map.append(1, 300);
      expect(map.get(1), equals(300));
    });

    test('Size method', () {
      final map = CompactIntMap();
      expect(map.size(), equals(0));
      map.put(1, 100);
      expect(map.size(), equals(1));
      map.put(2, 200);
      expect(map.size(), equals(2));
      map.remove(1);
      expect(map.size(), equals(1));
      map.clear();
      expect(map.size(), equals(0));
    });

    test('Keys and Values retrieval', () {
      final map = CompactIntMap();
      map.put(1, 100);
      map.put(2, 200);
      expect(map.keyAt(0), equals(1));
      expect(map.valueAt(0), equals(100));
      expect(map.keyAt(1), equals(2));
      expect(map.valueAt(1), equals(200));
    });

    test('Set value at index', () {
      final map = CompactIntMap();
      map.put(1, 100);
      map.put(2, 200);
      map.setValueAt(0, 300);
      expect(map.valueAt(0), equals(300));
    });

    test('RemoveAt method removes correct key-value pair', () {
      final map = CompactIntMap();
      map.put(1, 100);
      map.put(2, 200);
      map.removeAt(0);
      expect(map.size(), equals(1));
      expect(map.get(1), equals(null));
      expect(map.get(2), equals(200));
    });

    test('Append method with non-increasing key', () {
      final map = CompactIntMap();
      map.append(2, 200);
      map.append(1, 100);
      expect(map.get(1), equals(100));
      expect(map.get(2), equals(200));
    });

    test('ToString representation of empty map', () {
      final map = CompactIntMap();
      expect(map.toString(), equals('{}'));
    });

    test('GetOrDefault with negative key', () {
      final map = CompactIntMap();
      expect(map.getOrDefault(-1, -1), equals(-1));
    });

    test('SetValueAt with invalid index throws error', () {
      final map = CompactIntMap();
      map.put(1, 100);
      expect(() => map.setValueAt(1, 200), throwsRangeError);
    });

    test('KeyAt with invalid index throws error', () {
      final map = CompactIntMap();
      map.put(1, 100);
      expect(() => map.keyAt(1), throwsRangeError);
    });

    test('ValueAt with invalid index throws error', () {
      final map = CompactIntMap();
      map.put(1, 100);
      expect(() => map.valueAt(1), throwsRangeError);
    });
  });
}
