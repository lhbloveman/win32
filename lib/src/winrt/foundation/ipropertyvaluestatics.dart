// ipropertyvaluestatics.dart

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import, directives_ordering
// ignore_for_file: constant_identifier_names, non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../api_ms_win_core_winrt_string_l1_1_0.dart';
import '../../combase.dart';
import '../../exceptions.dart';
import '../../macros.dart';
import '../../utils.dart';
import '../../types.dart';
import '../../winrt_callbacks.dart';
import '../../winrt_helpers.dart';

import '../../winrt/internal/hstring_array.dart';

import '../../guid.dart';
import '../../winrt/foundation/structs.g.dart';
import '../../com/iinspectable.dart';

/// @nodoc
const IID_IPropertyValueStatics = '{629BDBC8-D932-4FF4-96B9-8D96C5C1E858}';

/// {@category Interface}
/// {@category winrt}
class IPropertyValueStatics extends IInspectable {
  // vtable begins at 6, is 39 entries long.
  IPropertyValueStatics.fromRawPointer(super.ptr);

  factory IPropertyValueStatics.from(IInspectable interface) =>
      IPropertyValueStatics.fromRawPointer(
          interface.toInterface(IID_IPropertyValueStatics));

  Pointer<COMObject> createEmpty() {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createUInt8(int value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(7)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Uint8 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createInt16(int value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(8)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Int16 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createUInt16(int value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(9)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Uint16 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createInt32(int value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(10)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Int32 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createUInt32(int value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(11)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Uint32 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createInt64(int value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(12)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Int64 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createUInt64(int value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(13)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Uint64 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createSingle(double value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(14)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Float value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, double value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createDouble(double value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(15)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Double value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, double value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createChar16(int value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(16)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Uint16 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createBoolean(bool value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(17)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Bool value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, bool value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createString(String value) {
    final retValuePtr = calloc<COMObject>();
    final valueHstring = convertToHString(value);
    final hr = ptr.ref.vtable
            .elementAt(18)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, IntPtr value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueHstring, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    WindowsDeleteString(valueHstring);
    return retValuePtr;
  }

  Pointer<COMObject> createInspectable(Pointer<COMObject> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(19)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Pointer<COMObject> value,
                            Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(
                    Pointer, Pointer<COMObject> value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value.cast<Pointer<COMObject>>().value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createGuid(GUID value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(20)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, GUID value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, GUID value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createDateTime(DateTime value) {
    final retValuePtr = calloc<COMObject>();
    final valueDateTime =
        value.difference(DateTime.utc(1601, 01, 01)).inMicroseconds * 10;
    final hr = ptr.ref.vtable
            .elementAt(21)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Uint64 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueDateTime, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createTimeSpan(Duration value) {
    final retValuePtr = calloc<COMObject>();
    final valueDuration = value.inMicroseconds * 10;
    final hr = ptr.ref.vtable
            .elementAt(22)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Uint64 value, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueDuration, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createPoint(Point value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(23)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Point value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, Point value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createSize(Size value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(24)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Size value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, Size value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createRect(Rect value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(25)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, Rect value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, Rect value, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createUInt8Array(int valueSize, Pointer<Uint8> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(26)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Uint8> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Uint8> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createInt16Array(int valueSize, Pointer<Int16> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(27)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Int16> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Int16> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createUInt16Array(int valueSize, Pointer<Uint16> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(28)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Uint16> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Uint16> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createInt32Array(int valueSize, Pointer<Int32> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(29)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Int32> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Int32> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createUInt32Array(int valueSize, Pointer<Uint32> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(30)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Uint32> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Uint32> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createInt64Array(int valueSize, Pointer<Int64> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(31)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Int64> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Int64> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createUInt64Array(int valueSize, Pointer<Uint64> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(32)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Uint64> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Uint64> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createSingleArray(int valueSize, Pointer<Float> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(33)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Float> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Float> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createDoubleArray(int valueSize, Pointer<Double> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(34)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Double> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Double> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createChar16Array(int valueSize, Pointer<Uint16> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(35)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Uint16> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Uint16> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createBooleanArray(int valueSize, Pointer<Bool> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(36)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Bool> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Bool> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createStringArray(int valueSize, Pointer<IntPtr> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(37)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<IntPtr> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<IntPtr> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createInspectableArray(
      int valueSize, Pointer<COMObject> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(38)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<COMObject> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<COMObject> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createGuidArray(int valueSize, Pointer<GUID> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(39)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<GUID> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<GUID> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createDateTimeArray(int valueSize, Pointer<Uint64> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(40)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Uint64> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Uint64> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createTimeSpanArray(int valueSize, Pointer<Uint64> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(41)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Uint64> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Uint64> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createPointArray(int valueSize, Pointer<Point> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(42)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Point> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Point> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createSizeArray(int valueSize, Pointer<Size> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(43)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Size> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Size> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  Pointer<COMObject> createRectArray(int valueSize, Pointer<Rect> value) {
    final retValuePtr = calloc<COMObject>();

    final hr = ptr.ref.vtable
            .elementAt(44)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(Pointer, Uint32 valueSize,
                            Pointer<Rect> value, Pointer<COMObject>)>>>()
            .value
            .asFunction<
                int Function(Pointer, int valueSize, Pointer<Rect> value,
                    Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, valueSize, value, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }
}
