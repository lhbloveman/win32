// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../api_ms_win_core_winrt_string_l1_1_0.dart';
import '../../com/iinspectable.dart';
import '../../combase.dart';
import '../../guid.dart';
import '../../types.dart';
import '../../utils.dart';
import '../../winrt_helpers.dart';
import '../foundation/enums.g.dart';
import '../foundation/ipropertyvalue.dart';
import '../foundation/propertyvalue.dart';
import '../foundation/structs.g.dart';
import 'comobject_pointer.dart';
import 'hstring_array.dart';
import 'int_array.dart';

extension IPropertyValueHelper on IPropertyValue {
  /// Gets the type that is represented as an [IPropertyValue].
  Object? get value {
    if (ptr.ref.lpVtbl == nullptr) return null;

    // If the object does not implement the IPropertyValue interface, return it
    // as an `IInspectable` object.
    if (!iids.contains(IID_IPropertyValue)) return IInspectable(ptr);

    switch (this.type) {
      case PropertyType.boolean:
        return getBoolean();
      case PropertyType.booleanArray:
        return _boolListFromArray(getBooleanArray);
      case PropertyType.char16:
        return getChar16();
      case PropertyType.char16Array:
        return _char16ListFromArray(getChar16Array);
      case PropertyType.dateTime:
        return getDateTime();
      case PropertyType.dateTimeArray:
        return _dateTimeListFromArray(getDateTimeArray);
      case PropertyType.double_:
        return getDouble();
      case PropertyType.doubleArray:
        return _doubleListFromArray(getDoubleArray);
      case PropertyType.guid:
        return getGuid();
      case PropertyType.guidArray:
        return _guidListFromArray(getGuidArray);
      case PropertyType.inspectableArray:
        return _inspectableListFromArray(getInspectableArray);
      case PropertyType.int16:
        return getInt16();
      case PropertyType.int16Array:
        return _int16ListFromArray(getInt16Array);
      case PropertyType.int32:
        return getInt32();
      case PropertyType.int32Array:
        return _int32ListFromArray(getInt32Array);
      case PropertyType.int64:
        return getInt64();
      case PropertyType.int64Array:
        return _int64ListFromArray(getInt64Array);
      case PropertyType.point:
        return getPoint();
      case PropertyType.pointArray:
        return _pointListFromArray(getPointArray);
      case PropertyType.rect:
        return getRect();
      case PropertyType.rectArray:
        return _rectListFromArray(getRectArray);
      case PropertyType.single:
        return getSingle();
      case PropertyType.singleArray:
        return _singleListFromArray(getSingleArray);
      case PropertyType.size:
        return getSize();
      case PropertyType.sizeArray:
        return _sizeListFromArray(getSizeArray);
      case PropertyType.string:
        return getString();
      case PropertyType.stringArray:
        return _stringListFromArray(getStringArray);
      case PropertyType.timeSpan:
        return getTimeSpan();
      case PropertyType.timeSpanArray:
        return _durationListFromArray(getTimeSpanArray);
      case PropertyType.uInt16:
        return getUInt16();
      case PropertyType.uInt16Array:
        return _uint16ListFromArray(getUInt16Array);
      case PropertyType.uInt32:
        return getUInt32();
      case PropertyType.uInt32Array:
        return _uint32ListFromArray(getUInt32Array);
      case PropertyType.uInt64:
        return getUInt64();
      case PropertyType.uInt64Array:
        return _uint64ListFromArray(getUInt64Array);
      case PropertyType.uInt8:
        return getUInt8();
      case PropertyType.uInt8Array:
        return _uint8ListFromArray(getUInt8Array);
      default:
        throw UnsupportedError('Unsupported type: ${this.type}');
    }
  }
}

List<bool> _boolListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Bool>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Bool>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return [for (var i = 0; i < pValueSize.value; i++) pValue.value[i]];
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<int> _char16ListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Uint16>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Uint16>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(length: pValueSize.value);
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<DateTime> _dateTimeListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Uint64>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Uint64>>();

  try {
    getArrayCallback(pValueSize, pValue);
    final values = pValue.value.toList(length: pValueSize.value);
    return values
        .map(
          (value) => DateTime.utc(1601, 01, 01)
              .add(Duration(microseconds: value ~/ 10)),
        )
        .toList();
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<double> _doubleListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Double>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Double>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return [for (var i = 0; i < pValueSize.value; i++) pValue.value[i]];
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<GUID> _guidListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<GUID>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<GUID>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return [for (var i = 0; i < pValueSize.value; i++) pValue.value[i]];
  } finally {
    free(pValueSize);
  }
}

List<IInspectable> _inspectableListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<COMObject>>)
        getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<COMObject>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(IInspectable.new, length: pValueSize.value);
  } finally {
    free(pValueSize);
  }
}

List<int> _int16ListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Int16>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Int16>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(length: pValueSize.value);
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<int> _int32ListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Int32>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Int32>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(length: pValueSize.value);
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<int> _int64ListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Int64>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Int64>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(length: pValueSize.value);
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<Point> _pointListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Point>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Point>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return [for (var i = 0; i < pValueSize.value; i++) pValue.value[i]];
  } finally {
    free(pValueSize);
  }
}

List<Rect> _rectListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Rect>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Rect>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return [for (var i = 0; i < pValueSize.value; i++) pValue.value[i]];
  } finally {
    free(pValueSize);
  }
}

List<double> _singleListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Float>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Float>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return [for (var i = 0; i < pValueSize.value; i++) pValue.value[i]];
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<Size> _sizeListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Size>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Size>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return [for (var i = 0; i < pValueSize.value; i++) pValue.value[i]];
  } finally {
    free(pValueSize);
  }
}

List<String> _stringListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<HSTRING>>)
        getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<HSTRING>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(length: pValueSize.value);
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<Duration> _durationListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Uint64>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Uint64>>();

  try {
    getArrayCallback(pValueSize, pValue);
    final values = pValue.value.toList(length: pValueSize.value);
    return values.map((value) => Duration(microseconds: value ~/ 10)).toList();
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<int> _uint16ListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Uint16>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Uint16>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(length: pValueSize.value);
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<int> _uint32ListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Uint32>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Uint32>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(length: pValueSize.value);
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<int> _uint64ListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Uint64>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Uint64>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(length: pValueSize.value);
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

List<int> _uint8ListFromArray(
    void Function(Pointer<Uint32>, Pointer<Pointer<Uint8>>) getArrayCallback) {
  final pValueSize = calloc<Uint32>();
  final pValue = calloc<Pointer<Uint8>>();

  try {
    getArrayCallback(pValueSize, pValue);
    return pValue.value.toList(length: pValueSize.value);
  } finally {
    free(pValueSize);
    free(pValue);
  }
}

/// Boxes [value] so that it can be passed to the WinRT APIs that take
/// `IPropertyValue` interface as a parameter.
///
/// This is used when working with `IMap` and `IReference` types.
Pointer<COMObject> boxValue(Object? value) {
  if (value == null) return PropertyValue.createEmpty();

  // There is no need to box IInspectable objects since .createInspectable()
  // returns the object provided without modification.
  // See https://docs.microsoft.com/en-us/uwp/api/windows.foundation.PropertyValue.createinspectable
  if (value is IInspectable) return value.ptr;

  if (value is bool) return PropertyValue.createBoolean(value);
  if (value is DateTime) return PropertyValue.createDateTime(value);
  if (value is double) return PropertyValue.createDouble(value);
  if (value is Duration) return PropertyValue.createTimeSpan(value);
  if (value is GUID) return PropertyValue.createGuid(value);
  if (value is int) return PropertyValue.createInt64(value);
  if (value is Point) return PropertyValue.createPoint(value);
  if (value is Rect) return PropertyValue.createRect(value);
  if (value is Size) return PropertyValue.createSize(value);
  if (value is String) return PropertyValue.createString(value);

  if (value is List<bool>) return _boxBoolList(value);
  if (value is List<DateTime>) return _boxDateTimeList(value);
  if (value is List<double>) return _boxDoubleList(value);
  if (value is List<Duration>) return _boxDurationList(value);
  if (value is List<GUID>) return _boxGuidList(value);
  if (value is List<IInspectable>) return _boxInspectableList(value);
  if (value is List<int>) return _boxIntList(value);
  if (value is List<Point>) return _boxPointList(value);
  if (value is List<Rect>) return _boxRectList(value);
  if (value is List<Size>) return _boxSizeList(value);
  if (value is List<String>) return _boxStringList(value);

  throw ArgumentError.value(value, 'value', 'Unsupported value');
}

Pointer<COMObject> _boxBoolList(List<bool> list) {
  final pArray = calloc<Bool>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray[i] = list.elementAt(i);
  }

  try {
    return PropertyValue.createBooleanArray(list.length, pArray);
  } finally {
    free(pArray);
  }
}

Pointer<COMObject> _boxDateTimeList(List<DateTime> list) {
  final pArray = calloc<Uint64>(list.length);
  for (var i = 0; i < list.length; i++) {
    final dateTimeValue = list
            .elementAt(i)
            .difference(DateTime.utc(1601, 01, 01))
            .inMicroseconds *
        10;
    pArray[i] = dateTimeValue;
  }

  try {
    return PropertyValue.createDateTimeArray(list.length, pArray);
  } finally {
    free(pArray);
  }
}

Pointer<COMObject> _boxDoubleList(List<double> list) {
  final pArray = calloc<Double>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray[i] = list.elementAt(i);
  }

  try {
    return PropertyValue.createDoubleArray(list.length, pArray);
  } finally {
    free(pArray);
  }
}

Pointer<COMObject> _boxDurationList(List<Duration> list) {
  final pArray = calloc<Uint64>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray[i] = list.elementAt(i).inMicroseconds * 10;
  }

  try {
    return PropertyValue.createTimeSpanArray(list.length, pArray);
  } finally {
    free(pArray);
  }
}

Pointer<COMObject> _boxGuidList(List<GUID> list) {
  final pArray = calloc<GUID>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray.elementAt(i).ref.setGUID(list.elementAt(i).toString());
  }

  try {
    return PropertyValue.createGuidArray(list.length, pArray);
  } finally {
    free(pArray);
  }
}

Pointer<COMObject> _boxPointList(List<Point> list) {
  final pArray = calloc<Point>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray[i] = list.elementAt(i);
  }

  try {
    return PropertyValue.createPointArray(list.length, pArray);
  } finally {
    free(pArray);
  }
}

Pointer<COMObject> _boxRectList(List<Rect> list) {
  final pArray = calloc<Rect>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray[i] = list.elementAt(i);
  }

  try {
    return PropertyValue.createRectArray(list.length, pArray);
  } finally {
    free(pArray);
  }
}

Pointer<COMObject> _boxSizeList(List<Size> list) {
  final pArray = calloc<Size>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray[i] = list.elementAt(i);
  }

  try {
    return PropertyValue.createSizeArray(list.length, pArray);
  } finally {
    free(pArray);
  }
}

Pointer<COMObject> _boxIntList(List<int> list) {
  final pArray = calloc<Int64>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray[i] = list.elementAt(i);
  }

  try {
    return PropertyValue.createInt64Array(list.length, pArray);
  } finally {
    free(pArray);
  }
}

Pointer<COMObject> _boxStringList(List<String> list) {
  final handles = <int>[];
  final pArray = calloc<HSTRING>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray[i] = convertToHString(list.elementAt(i));
    handles.add(pArray[i]);
  }

  try {
    return PropertyValue.createStringArray(list.length, pArray);
  } finally {
    free(pArray);
    handles.forEach(WindowsDeleteString);
  }
}

Pointer<COMObject> _boxInspectableList(List<IInspectable> list) {
  final pArray = calloc<COMObject>(list.length);
  for (var i = 0; i < list.length; i++) {
    pArray[i] = list.elementAt(i).ptr.ref;
  }

  try {
    return PropertyValue.createInspectableArray(list.length, pArray);
  } finally {
    free(pArray);
  }
}
