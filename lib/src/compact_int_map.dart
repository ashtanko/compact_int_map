import 'dart:collection';

/// A compact implementation of a map with integer keys and values.
/// This class uses binary search for efficient key lookups and maintains
/// the keys and values in separate lists.
class CompactIntMap with MapMixin<int, int> {
  final List<int> _keys;
  final List<int> _values;
  int _size;

  /// Creates an empty [CompactIntMap].
  CompactIntMap() : this._internal(0);

  /// Creates an empty [CompactIntMap] with the specified initial capacity.
  CompactIntMap.withCapacity(int initialCapacity)
      : this._internal(initialCapacity);

  CompactIntMap._internal(int initialCapacity)
      : _keys = List.filled(initialCapacity, 0, growable: true),
        _values = List.filled(initialCapacity, 0, growable: true),
        _size = 0;

  /// Returns the value associated with the given [key], or `null` if the key
  /// is not present.
  int? get(int key) => getOrDefault(key, null);

  /// Returns the value associated with the given [key], or [defaultValue] if
  /// the key is not present.
  int? getOrDefault(int key, int? defaultValue) {
    final index = _binarySearch(_keys, _size, key);
    return index < 0 ? defaultValue : _values[index];
  }

  @override
  int? remove(Object? key) {
    if (key is int) {
      final index = indexOfKey(key);
      if (index >= 0) {
        final value = _values[index];
        removeAt(index);
        return value;
      }
    }
    return null;
  }

  /// Removes the key-value pair at the specified [index].
  void removeAt(int index) {
    _keys.removeAt(index);
    _values.removeAt(index);
    _size--;
  }

  /// Associates the specified [value] with the specified [key].
  void put(int key, int value) {
    var index = _binarySearch(_keys, _size, key);
    if (index >= 0) {
      _values[index] = value;
    } else {
      index = ~index;
      _keys.insert(index, key);
      _values.insert(index, value);
      _size++;
    }
  }

  /// Returns the number of key-value pairs in the map.
  int size() => _size;

  /// Returns the key at the specified [index].
  int keyAt(int index) => _keys[index];

  /// Returns the value at the specified [index].
  int valueAt(int index) => _values[index];

  /// Sets the value at the specified [index] to [value].
  void setValueAt(int index, int value) {
    _values[index] = value;
  }

  /// Returns the index of the specified [key], or a negative value if the key
  /// is not present.
  int indexOfKey(int key) => _binarySearch(_keys, _size, key);

  /// Returns the index of the specified [value], or -1 if the value is not
  /// present.
  int indexOfValue(int value) => _values.indexOf(value);

  /// Removes all key-value pairs from the map.
  @override
  void clear() {
    _size = 0;
    _keys.clear();
    _values.clear();
  }

  /// Appends the specified [key] and [value] to the map.
  /// If the key is not greater than the last key in the map, it uses [put]
  /// instead.
  void append(int key, int value) {
    if (_size != 0 && key <= _keys[_size - 1]) {
      put(key, value);
    } else {
      _keys.add(key);
      _values.add(value);
      _size++;
    }
  }

  @override
  String toString() {
    if (_size <= 0) {
      return '{}';
    }
    final buffer = StringBuffer('{');
    for (var i = 0; i < _size; i++) {
      if (i > 0) {
        buffer.write(', ');
      }
      buffer.write('${_keys[i]}=${_values[i]}');
    }
    buffer.write('}');
    return buffer.toString();
  }

  /// Performs a binary search on the [array] for the specified [key].
  /// Returns the index of the key if found, otherwise returns a negative value.
  int _binarySearch(List<int> array, int size, int key) {
    int low = 0;
    int high = size - 1;

    while (low <= high) {
      final mid = (low + high) >> 1;
      final midVal = array[mid];

      if (midVal < key) {
        low = mid + 1;
      } else if (midVal > key) {
        high = mid - 1;
      } else {
        return mid;
      }
    }
    return ~low;
  }

  /// Moves to the next element in the map.
  /// Returns `true` if there is a next element, otherwise `false`.
  bool moveNext() {
    if (_currentIndex + 1 < _size) {
      _currentIndex++;
      return true;
    }
    return false;
  }

  /// Returns the current key-value pair as a [MapEntry].
  MapEntry<int, int> get current {
    if (_currentIndex < 0 || _currentIndex >= _size) {
      throw StateError('Current index is out of bounds');
    }
    return MapEntry(_keys[_currentIndex], _values[_currentIndex]);
  }

  int _currentIndex = -1;

  @override
  int? operator [](Object? key) {
    if (key is int) {
      return get(key);
    } else {
      return null;
    }
  }

  @override
  void operator []=(int key, int value) {
    put(key, value);
  }

  @override
  Iterable<int> get keys => _keys.sublist(0, _size);
}
