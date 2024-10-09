import 'package:compact_int_map/src/compact_int_map.dart';

void main() {
  final map = CompactIntMap();

  // Adding key-value pairs
  map.put(1, 100);
  map.put(2, 200);
  map.put(3, 300);

  // Retrieving values
  // ignore: avoid_print
  print('Value for key 1: ${map.get(1)}'); // Output: Value for key 1: 100
  // ignore: avoid_print
  print('Value for key 2: ${map.get(2)}'); // Output: Value for key 2: 200
  // ignore: avoid_print
  print('Value for key 3: ${map.get(3)}'); // Output: Value for key 3: 300
  // ignore: avoid_print
  print(
    'Value for key 4 (not set): ${map.get(4)}',
  ); // Output: Value for key 4 (not set): null

  // Updating an existing value
  map.put(2, 250);
  // ignore: avoid_print
  print(
    'Updated value for key 2: ${map.get(2)}',
  ); // Output: Updated value for key 2: 250

  // Removing a key
  map.remove(3);
  // ignore: avoid_print
  print(
    'Value for key 3 after removal: ${map.get(3)}',
  ); // Output: Value for key 3 after removal: null

  // Getting the size of the map
  // ignore: avoid_print
  print(
    'Current size of the map: ${map.size()}',
  ); // Output: Current size of the map: 2

  // Clearing the map
  map.clear();
  // ignore: avoid_print
  print(
    'Size of the map after clearing: ${map.size()}',
  ); // Output: Size of the map after clearing: 0
}
