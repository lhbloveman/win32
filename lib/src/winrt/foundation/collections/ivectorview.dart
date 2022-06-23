// ivectorview.dart

// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../../../api_ms_win_core_winrt_string_l1_1_0.dart';
import '../../../com/iinspectable.dart';
import '../../../combase.dart';
import '../../../exceptions.dart';
import '../../../macros.dart';
import '../../../types.dart';
import '../../../utils.dart';
import '../../../winrt/internal/winrt_vector_helper.dart';
import '../../../winrt_helpers.dart';
import 'iiterable.dart';
import 'iiterator.dart';

/// @nodoc
const IID_IVectorView = '{BBE1FA4C-B0E3-4583-BAEF-1F1B2E483E56}';

/// {@category Interface}
/// {@category winrt}
class IVectorView<T> extends IInspectable implements IIterable<T> {
  // vtable begins at 6, is 4 entries long.
  final T Function(Pointer<COMObject>)? _creator;
  final Allocator _allocator;

  /// Creates an instance of `IVectorView<T>` using the given `ptr`.
  ///
  /// `T` must be a either a `String` or a `WinRT` type. e.g. `IHostName`,
  /// `IStorageFile` etc.
  ///
  /// ```dart
  /// ...
  /// final vectorView = IVectorView<String>.fromRawPointer(ptr);
  /// ```
  ///
  /// `creator` must be specified if the `T` is a `WinRT` type.
  /// e.g. `IHostName.fromRawPointer`, `IStorageFile.fromRawPointer` etc.
  ///
  /// ```dart
  /// ...
  /// final allocator = Arena();
  /// final vectorView = IVectorView<IHostName>.fromRawPointer(ptr,
  ///     creator: IHostName.fromRawPointer, allocator: allocator);
  /// ```
  ///
  /// It is the caller's responsibility to deallocate the returned pointers
  /// from methods like `GetAt`, `GetView` and `toList` when they are finished
  /// with it. A FFI `Arena` may be passed as a custom allocator for ease of
  /// memory management.
  IVectorView.fromRawPointer(super.ptr,
      {T Function(Pointer<COMObject>)? creator, Allocator allocator = calloc})
      : _creator = creator,
        _allocator = allocator {
    // TODO: Need to update this once we add support for types like `int`,
    // `bool`, `double`, `GUID`, `DateTime`, `Point`, `Size` etc.
    if (![String].contains(T) && creator == null) {
      throw ArgumentError(
          '`creator` parameter must be specified for WinRT types!');
    }
  }

  /// Returns the item at the specified index in the vector view.
  T getAt(int index) {
    switch (T) {
      // TODO: Need to update this once we add support for types like `int`,
      // `bool`, `double`, `GUID`, `DateTime`, `Point`, `Size` etc.
      case String:
        return _getAt_String(index) as T;
      // Handle WinRT types
      default:
        return _creator!(_getAt_COMObject(index));
    }
  }

  Pointer<COMObject> _getAt_COMObject(int index) {
    final retValuePtr = _allocator<COMObject>();

    final hr = ptr.ref.vtable
        .elementAt(6)
        .cast<
            Pointer<
                NativeFunction<
                    HRESULT Function(
          Pointer,
          Uint32,
          Pointer<COMObject>,
        )>>>()
        .value
        .asFunction<
            int Function(
          Pointer,
          int,
          Pointer<COMObject>,
        )>()(ptr.ref.lpVtbl, index, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    return retValuePtr;
  }

  String _getAt_String(int index) {
    final retValuePtr = calloc<HSTRING>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(6)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(
            Pointer,
            Uint32,
            Pointer<HSTRING>,
          )>>>()
          .value
          .asFunction<
              int Function(
            Pointer,
            int,
            Pointer<HSTRING>,
          )>()(ptr.ref.lpVtbl, index, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.toDartString();
      return retValue;
    } finally {
      WindowsDeleteString(retValuePtr.value);
      free(retValuePtr);
    }
  }

  /// Gets the number of items in the vector view.
  int get size {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(7)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(
            Pointer,
            Pointer<Uint32>,
          )>>>()
          .value
          .asFunction<
              int Function(
            Pointer,
            Pointer<Uint32>,
          )>()(ptr.ref.lpVtbl, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  /// Retrieves the index of a specified item in the vector view.
  bool indexOf(T value, Pointer<Uint32> index) {
    switch (T) {
      // TODO: Need to update this once we add support for types like `int`,
      // `bool`, `double`, `GUID`, `DateTime`, `Point`, `Size` etc.
      case String:
        return _indexOf_String(value as String, index);
      // Handle WinRT types
      default:
        return _indexOf_COMObject(value, index);
    }
  }

  bool _indexOf_COMObject(T value, Pointer<Uint32> index) {
    final retValuePtr = calloc<Bool>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(8)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(
            Pointer,
            COMObject,
            Pointer<Uint32>,
            Pointer<Bool>,
          )>>>()
          .value
          .asFunction<
              int Function(
            Pointer,
            COMObject,
            Pointer<Uint32>,
            Pointer<Bool>,
          )>()(
        ptr.ref.lpVtbl,
        (value as IInspectable).ptr.ref,
        index,
        retValuePtr,
      );

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  bool _indexOf_String(String value, Pointer<Uint32> index) {
    final retValuePtr = calloc<Bool>();
    final hValue = convertToHString(value);

    try {
      final hr = ptr.ref.vtable
          .elementAt(8)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(
            Pointer,
            HSTRING,
            Pointer<Uint32>,
            Pointer<Bool>,
          )>>>()
          .value
          .asFunction<
              int Function(
            Pointer,
            int,
            Pointer<Uint32>,
            Pointer<Bool>,
          )>()(ptr.ref.lpVtbl, hValue, index, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
      WindowsDeleteString(hValue);
    }
  }

  /// Retrieves multiple items from the vector view beginning at the given
  /// index.
  int getMany(int startIndex, Pointer<NativeType> items) {
    switch (T) {
      // TODO: Need to update this once we add support for types like `int`,
      // `bool`, `double`, `GUID`, `DateTime`, `Point`, `Size` etc.
      case String:
        return _getMany_String(startIndex, items.cast());
      // Handle WinRT types
      default:
        return _getMany_COMObject(startIndex, items.cast());
    }
  }

  int _getMany_COMObject(int startIndex, Pointer<COMObject> items) {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(9)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(
            Pointer,
            Uint32,
            Uint32,
            Pointer<COMObject>,
            Pointer<Uint32>,
          )>>>()
          .value
          .asFunction<
              int Function(
            Pointer,
            int,
            int,
            Pointer<COMObject>,
            Pointer<Uint32>,
          )>()(
        ptr.ref.lpVtbl,
        startIndex,
        size - startIndex,
        items,
        retValuePtr,
      );

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  int _getMany_String(int startIndex, Pointer<HSTRING> items) {
    final retValuePtr = calloc<Uint32>();

    try {
      final hr = ptr.ref.vtable
          .elementAt(9)
          .cast<
              Pointer<
                  NativeFunction<
                      HRESULT Function(
            Pointer,
            Uint32,
            Uint32,
            Pointer<HSTRING>,
            Pointer<Uint32>,
          )>>>()
          .value
          .asFunction<
              int Function(
            Pointer,
            int,
            int,
            Pointer<HSTRING>,
            Pointer<Uint32>,
          )>()(
        ptr.ref.lpVtbl,
        startIndex,
        size - startIndex,
        items,
        retValuePtr,
      );

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      free(retValuePtr);
    }
  }

  /// Creates a `List<T>` from the `IVectorView<T>`.
  List<T> toList() {
    if (size == 0) return [];
    return VectorHelper(_creator, getMany, size, allocator: _allocator)
        .toList();
  }

  // IID_IIterable is always the last item on the iids list for IVectorView
  late final _iIterable = IIterable<T>.fromRawPointer(toInterface(iids.last),
      creator: _creator, allocator: _allocator);

  @override
  IIterator<T> first() => _iIterable.first();
}
