import 'dart:collection';

import 'package:benchmarking/benchmarking.dart';
import 'package:compact_int_map/src/compact_int_map.dart';
import 'package:test/test.dart';

void main() {
  test('benchmark maps', () {
    final numbers = List.generate(10000, (i) => i);
    final map = {for (final n in numbers) n: n};
    final hashMap = HashMap<int, int>.fromEntries(map.entries);
    final compactIntMap = CompactIntMap();
    for (final n in numbers) {
      compactIntMap.put(n, n);
    }
    final randomizedKeys = numbers.toList()..shuffle();
    syncBenchmark(
      'Map[k]',
      () => randomizedKeys.map((key) => '${map[key]}'),
    ).report(units: numbers.length);
    syncBenchmark(
      'HashMap[k]',
      () => randomizedKeys.map((key) => '${hashMap[key]}'),
    ).report(units: numbers.length);
    syncBenchmark(
      'CompactIntMap[k]',
      () => randomizedKeys.map((key) => '${compactIntMap.get(key)}'),
    ).report(units: numbers.length);
  });
}
