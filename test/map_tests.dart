import 'dart:collection';

import 'package:compact_int_map/src/compact_int_map.dart';
import 'package:test/test.dart';

import 'abstract_map_helper.dart';

class HashMapTests extends AbstractMapTest {
  @override
  Map<int, int> createMap() {
    return HashMap();
  }
}

class CompactIntMapTests extends AbstractMapTest {
  @override
  Map<int, int> createMap() {
    return CompactIntMap();
  }
}

void main() {
  group('HashMapTests Tests', () {
    HashMapTests().runTests();
  });

  group('CompactIntMapTests Tests', () {
    CompactIntMapTests().runTests();
  });
}
