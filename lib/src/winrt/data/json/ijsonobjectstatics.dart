// ijsonobjectstatics.dart

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
import '../../../winrt/data/json/jsonobject.dart';
import '../../../winrt_helpers.dart';

/// @nodoc
const IID_IJsonObjectStatics = '{2289F159-54DE-45D8-ABCC-22603FA066A0}';

/// {@category Interface}
/// {@category winrt}
class IJsonObjectStatics extends IInspectable {
  // vtable begins at 6, is 2 entries long.
  IJsonObjectStatics.fromRawPointer(super.ptr);

  factory IJsonObjectStatics.from(IInspectable interface) =>
      IJsonObjectStatics.fromRawPointer(
          interface.toInterface(IID_IJsonObjectStatics));

  JsonObject parse(String input) {
    final retValuePtr = calloc<COMObject>();
    final inputHstring = convertToHString(input);
    final hr = ptr.ref.vtable
            .elementAt(6)
            .cast<
                Pointer<
                    NativeFunction<
                        HRESULT Function(
                            Pointer, IntPtr input, Pointer<COMObject>)>>>()
            .value
            .asFunction<int Function(Pointer, int input, Pointer<COMObject>)>()(
        ptr.ref.lpVtbl, inputHstring, retValuePtr);

    if (FAILED(hr)) throw WindowsException(hr);

    WindowsDeleteString(inputHstring);
    return JsonObject.fromRawPointer(retValuePtr);
  }

  bool tryParse(String input, JsonObject result) {
    final retValuePtr = calloc<Bool>();
    final inputHstring = convertToHString(input);

    try {
      final hr = ptr.ref.vtable
              .elementAt(7)
              .cast<
                  Pointer<
                      NativeFunction<
                          HRESULT Function(Pointer, IntPtr input,
                              Pointer<COMObject> result, Pointer<Bool>)>>>()
              .value
              .asFunction<
                  int Function(Pointer, int input, Pointer<COMObject> result,
                      Pointer<Bool>)>()(
          ptr.ref.lpVtbl, inputHstring, result.ptr, retValuePtr);

      if (FAILED(hr)) throw WindowsException(hr);

      final retValue = retValuePtr.value;
      return retValue;
    } finally {
      WindowsDeleteString(inputHstring);
      free(retValuePtr);
    }
  }
}
