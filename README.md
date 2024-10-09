## CompactIntMap

`CompactIntMap` is a lightweight implementation of an integer-keyed map that efficiently stores key-value pairs using two parallel lists for keys and values. It supports operations such as adding, updating, retrieving, and removing mappings, along with utility methods to get the size of the map, clear it, and clone its contents.

### Features
- Add Key-Value Pairs: Use put(key, value) to store values associated with integer keys.
- Retrieve Values: Use get(key) to retrieve values; returns null if the key is not present.
- Update Values: Reuse put(key, newValue) to update the value for an existing key.
- Remove Entries: Use remove(key) to delete a specific key-value pair from the map.
- Check Size: Use size() to get the current number of entries in the map.
- Clear Map: Use clear() to remove all entries from the map.

## Getting started

To use `lru_cache` in your Dart project, add it to your `pubspec.yaml`:

```dart
dependencies:
  compact_int_map: ^latest_version
```

## Usage
Here's an example of how to use the LruCache class:

```dart
import 'package:compact_int_map/compact_int_map.dart';

void main() {
  final map = CompactIntMap();

  // Adding key-value pairs
  map.put(1, 100);
  map.put(2, 200);
  map.put(3, 300);

  // Retrieving values
  print('Value for key 1: ${map.get(1)}'); // Output: Value for key 1: 100
  print('Value for key 2: ${map.get(2)}'); // Output: Value for key 2: 200
  print('Value for key 3: ${map.get(3)}'); // Output: Value for key 3: 300
  print(
    'Value for key 4 (not set): ${map.get(4)}',
  ); // Output: Value for key 4 (not set): null
  // Updating an existing value
  map.put(2, 250);
  print(
    'Updated value for key 2: ${map.get(2)}',
  ); // Output: Updated value for key 2: 250
  // Removing a key
  map.remove(3);
  print(
    'Value for key 3 after removal: ${map.get(3)}',
  ); // Output: Value for key 3 after removal: null
  // Getting the size of the map
  print(
    'Current size of the map: ${map.size()}',
  ); // Output: Current size of the map: 2
  // Clearing the map
  map.clear(); // Output: Size of the map after clearing: 0
}
```

## Contributing

Contributions are welcome! Please read the contributing guide to learn how to contribute to the project and set up a development environment.

## License

```plain
MIT License

Copyright (c) 2024 Oleksii Shtanko

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
