@TestOn('windows')

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:test/test.dart';
import 'package:win32/win32.dart';

// Test the WinRT PropertyValue object to make sure overrides, properties and
// methods are working correctly.

void main() {
  if (isWindowsRuntimeAvailable()) {
    setUp(winrtInitialize);

    test('UInt8', () {
      final pv = IPropertyValue.fromRawPointer(PropertyValue.createUInt8(30));
      expect(pv.type, equals(PropertyType.uInt8));
      expect(pv.getUInt8(), equals(30));
    });

    test('UInt8Array', () {
      final array = calloc<Uint8>(5);
      for (var idx = 0; idx < 5; idx++) {
        array[idx] = (10 * idx) + 10;
      }
      final pv = IPropertyValue.fromRawPointer(
          PropertyValue.createUInt8Array(5, array));
      expect(pv.type, equals(PropertyType.uInt8Array));

      final arraySize = calloc<Uint32>();
      final newArray = calloc<Pointer<Uint8>>();

      pv.getUInt8Array(arraySize, newArray);
      expect(arraySize.value, equals(5));
      expect(newArray.value[0], equals(10));
      expect(newArray.value[1], equals(20));
      expect(newArray.value[2], equals(30));
      expect(newArray.value[3], equals(40));
      expect(newArray.value[4], equals(50));
    });

    test('UInt16', () {
      final pv =
          IPropertyValue.fromRawPointer(PropertyValue.createUInt16(65534));
      expect(pv.type, equals(PropertyType.uInt16));
      expect(pv.getUInt16(), equals(65534));
    });

    test('UInt16Array', () {
      final array = calloc<Uint16>(5);
      for (var idx = 0; idx < 5; idx++) {
        array[idx] = (100 * idx) + 100;
      }
      final pv = IPropertyValue.fromRawPointer(
          PropertyValue.createUInt16Array(5, array));
      expect(pv.type, equals(PropertyType.uInt16Array));

      final arraySize = calloc<Uint32>();
      final newArray = calloc<Pointer<Uint16>>();

      pv.getUInt16Array(arraySize, newArray);
      expect(arraySize.value, equals(5));
      expect(newArray.value[0], equals(100));
      expect(newArray.value[1], equals(200));
      expect(newArray.value[2], equals(300));
      expect(newArray.value[3], equals(400));
      expect(newArray.value[4], equals(500));
    });

    test('Guid', () {
      final guid = calloc<GUID>()..ref.setGUID(IID_ICalendar);
      final pv =
          IPropertyValue.fromRawPointer(PropertyValue.createGuid(guid.ref));
      expect(pv.type, equals(PropertyType.guid));
      expect(pv.getGuid().toString(), equals(IID_ICalendar));
    });

    test('GuidArray', () {
      final array = calloc<GUID>(3);
      array[0].setGUID(IID_ICalendar);
      array[1].setGUID(IID_IFileOpenPicker);
      array[2].setGUID(IID_IStorageItem);
      final pv = IPropertyValue.fromRawPointer(
          PropertyValue.createGuidArray(3, array));
      expect(pv.type, equals(PropertyType.guidArray));

      final arraySize = calloc<Uint32>();
      final newArray = calloc<Pointer<GUID>>();

      pv.getGuidArray(arraySize, newArray);
      expect(arraySize.value, equals(3));
      expect(newArray.value[0].toString(), equals(IID_ICalendar));
      expect(newArray.value[1].toString(), equals(IID_IFileOpenPicker));
      expect(newArray.value[2].toString(), equals(IID_IStorageItem));
    });

    test('InspectableArray', () {
      final array = calloc<COMObject>(2);
      array[0] = Calendar().ptr.ref;
      array[1] = PhoneNumberFormatter().ptr.ref;
      final pv = IPropertyValue.fromRawPointer(
          PropertyValue.createInspectableArray(2, array));
      expect(pv.type, equals(PropertyType.inspectableArray));

      final arraySize = calloc<Uint32>();
      final newArray = calloc<Pointer<COMObject>>();

      pv.getInspectableArray(arraySize, newArray);
      expect(arraySize.value, equals(2));
      expect(IInspectable(newArray.value.elementAt(0)).runtimeClassName,
          equals('Windows.Globalization.Calendar'));
      expect(
          IInspectable(newArray.value.elementAt(1)).runtimeClassName,
          equals(
              'Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormatter'));
    });

    tearDown(winrtUninitialize);
  }
}
