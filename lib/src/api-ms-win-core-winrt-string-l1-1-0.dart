// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Maps FFI prototypes onto the corresponding Win32 API function calls

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'callbacks.dart';
import 'combase.dart';
import 'structs.dart';
import 'structs.g.dart';

final _api_ms_win_core_winrt_string_l1_1_0 =
    DynamicLibrary.open('api-ms-win-core-winrt-string-l1-1-0.dll');

/// Creates a new HSTRING based on the specified source string.
///
/// ```c
/// HRESULT WindowsCreateString(
///   PCNZWCH sourceString,
///   UINT32  length,
///   HSTRING *string
/// );
/// ```
/// {@category winrt}
int WindowsCreateString(
    Pointer<Utf16> sourceString, int length, Pointer<IntPtr> string) {
  final _WindowsCreateString =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Int32 Function(Pointer<Utf16> sourceString, Uint32 length,
              Pointer<IntPtr> string),
          int Function(Pointer<Utf16> sourceString, int length,
              Pointer<IntPtr> string)>('WindowsCreateString');
  return _WindowsCreateString(sourceString, length, string);
}

/// Decrements the reference count of a string buffer.
///
/// ```c
/// HRESULT WindowsDeleteString(
///   HSTRING string
/// );
/// ```
/// {@category winrt}
int WindowsDeleteString(int string) {
  final _WindowsDeleteString = _api_ms_win_core_winrt_string_l1_1_0
      .lookupFunction<Int32 Function(IntPtr string), int Function(int string)>(
          'WindowsDeleteString');
  return _WindowsDeleteString(string);
}

/// Discards a preallocated string buffer if it was not promoted to an
/// HSTRING.
///
/// ```c
/// HRESULT WindowsDeleteStringBuffer(
///   HSTRING_BUFFER bufferHandle
/// );
/// ```
/// {@category winrt}
int WindowsDeleteStringBuffer(int bufferHandle) {
  final _WindowsDeleteStringBuffer =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Int32 Function(IntPtr bufferHandle),
          int Function(int bufferHandle)>('WindowsDeleteStringBuffer');
  return _WindowsDeleteStringBuffer(bufferHandle);
}

/// Creates a copy of the specified string.
///
/// ```c
/// HRESULT WindowsDuplicateString(
///   HSTRING string,
/// HSTRING *newString
/// );
/// ```
/// {@category winrt}
int WindowsDuplicateString(int string, Pointer<IntPtr> newString) {
  final _WindowsDuplicateString =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Int32 Function(IntPtr string, Pointer<IntPtr> newString),
          int Function(
              int string, Pointer<IntPtr> newString)>('WindowsDuplicateString');
  return _WindowsDuplicateString(string, newString);
}

/// Gets the length, in Unicode characters, of the specified string.
///
/// ```c
/// UINT32 WindowsGetStringLen(
///   HSTRING string
/// );
/// ```
/// {@category winrt}
int WindowsGetStringLen(int string) {
  final _WindowsGetStringLen = _api_ms_win_core_winrt_string_l1_1_0
      .lookupFunction<Uint32 Function(IntPtr string), int Function(int string)>(
          'WindowsGetStringLen');
  return _WindowsGetStringLen(string);
}

/// Retrieves the backing buffer for the specified string.
///
/// ```c
/// PCWSTR WindowsGetStringRawBuffer(
///   HSTRING string,
///   UINT32  *length
/// );
/// ```
/// {@category winrt}
Pointer<Utf16> WindowsGetStringRawBuffer(int string, Pointer<Uint32> length) {
  final _WindowsGetStringRawBuffer =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Pointer<Utf16> Function(IntPtr string, Pointer<Uint32> length),
          Pointer<Utf16> Function(
              int string, Pointer<Uint32> length)>('WindowsGetStringRawBuffer');
  return _WindowsGetStringRawBuffer(string, length);
}

/// Indicates whether the specified string is the empty string.
///
/// ```c
/// BOOL WindowsIsStringEmpty(
///   HSTRING string
/// );
/// ```
/// {@category winrt}
int WindowsIsStringEmpty(int string) {
  final _WindowsIsStringEmpty = _api_ms_win_core_winrt_string_l1_1_0
      .lookupFunction<Int32 Function(IntPtr string), int Function(int string)>(
          'WindowsIsStringEmpty');
  return _WindowsIsStringEmpty(string);
}

/// Allocates a mutable character buffer for use in HSTRING creation.
///
/// ```c
/// HRESULT WindowsPreallocateStringBuffer(
///   UINT32         length,
///   WCHAR          **charBuffer,
///   HSTRING_BUFFER *bufferHandle
/// );
/// ```
/// {@category winrt}
int WindowsPreallocateStringBuffer(int length,
    Pointer<Pointer<Uint16>> charBuffer, Pointer<IntPtr> bufferHandle) {
  final _WindowsPreallocateStringBuffer =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Int32 Function(Uint32 length, Pointer<Pointer<Uint16>> charBuffer,
              Pointer<IntPtr> bufferHandle),
          int Function(int length, Pointer<Pointer<Uint16>> charBuffer,
              Pointer<IntPtr> bufferHandle)>('WindowsPreallocateStringBuffer');
  return _WindowsPreallocateStringBuffer(length, charBuffer, bufferHandle);
}

/// Creates an HSTRING from the specified HSTRING_BUFFER.
///
/// ```c
/// HRESULT WindowsPromoteStringBuffer(
///   HSTRING_BUFFER bufferHandle,
///   HSTRING        *string
/// );
/// ```
/// {@category winrt}
int WindowsPromoteStringBuffer(int bufferHandle, Pointer<IntPtr> string) {
  final _WindowsPromoteStringBuffer =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Int32 Function(IntPtr bufferHandle, Pointer<IntPtr> string),
          int Function(int bufferHandle,
              Pointer<IntPtr> string)>('WindowsPromoteStringBuffer');
  return _WindowsPromoteStringBuffer(bufferHandle, string);
}

/// Replaces all occurrences of a set of characters in the specified string
/// with another set of characters to create a new string.
///
/// ```c
/// HRESULT WindowsReplaceString(
///   HSTRING string,
///   HSTRING stringReplaced,
///   HSTRING stringReplaceWith,
///   HSTRING *newString
/// );
/// ```
/// {@category winrt}
int WindowsReplaceString(int string, int stringReplaced, int stringReplaceWith,
    Pointer<IntPtr> newString) {
  final _WindowsReplaceString =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Int32 Function(IntPtr string, IntPtr stringReplaced,
              IntPtr stringReplaceWith, Pointer<IntPtr> newString),
          int Function(int string, int stringReplaced, int stringReplaceWith,
              Pointer<IntPtr> newString)>('WindowsReplaceString');
  return _WindowsReplaceString(
      string, stringReplaced, stringReplaceWith, newString);
}

/// Indicates whether the specified string has embedded null characters.
///
/// ```c
/// HRESULT WindowsStringHasEmbeddedNull(
///   HSTRING string,
///   BOOL    *hasEmbedNull);
/// ```
/// {@category winrt}
int WindowsStringHasEmbeddedNull(int string, Pointer<Int32> hasEmbedNull) {
  final _WindowsStringHasEmbeddedNull =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Int32 Function(IntPtr string, Pointer<Int32> hasEmbedNull),
          int Function(int string,
              Pointer<Int32> hasEmbedNull)>('WindowsStringHasEmbeddedNull');
  return _WindowsStringHasEmbeddedNull(string, hasEmbedNull);
}

/// Retrieves a substring from the specified string. The substring starts
/// at the specified character position.
///
/// ```c
/// HRESULT WindowsSubstring(
///   HSTRING string,
///   UINT32  startIndex,
///   HSTRING *newString
/// );
/// ```
/// {@category winrt}
int WindowsSubstring(int string, int startIndex, Pointer<IntPtr> newString) {
  final _WindowsSubstring = _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
      Int32 Function(
          IntPtr string, Uint32 startIndex, Pointer<IntPtr> newString),
      int Function(int string, int startIndex,
          Pointer<IntPtr> newString)>('WindowsSubstring');
  return _WindowsSubstring(string, startIndex, newString);
}

/// Retrieves a substring from the specified string. The substring starts
/// at a specified character position and has a specified length.
///
/// ```c
/// HRESULT WindowsSubstringWithSpecifiedLength(
///   HSTRING string,
///   UINT32  startIndex,
///   UINT32  length,
///   HSTRING *newString
/// );
/// ```
/// {@category winrt}
int WindowsSubstringWithSpecifiedLength(
    int string, int startIndex, int length, Pointer<IntPtr> newString) {
  final _WindowsSubstringWithSpecifiedLength =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
              Int32 Function(IntPtr string, Uint32 startIndex, Uint32 length,
                  Pointer<IntPtr> newString),
              int Function(int string, int startIndex, int length,
                  Pointer<IntPtr> newString)>(
          'WindowsSubstringWithSpecifiedLength');
  return _WindowsSubstringWithSpecifiedLength(
      string, startIndex, length, newString);
}

/// Removes all trailing occurrences of a specified set of characters from
/// the source string.
///
/// ```c
/// HRESULT WindowsTrimStringEnd(
///   HSTRING string,
///   HSTRING trimString,
///   HSTRING *newString
/// );
/// ```
/// {@category winrt}
int WindowsTrimStringEnd(
    int string, int trimString, Pointer<IntPtr> newString) {
  final _WindowsTrimStringEnd =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Int32 Function(
              IntPtr string, IntPtr trimString, Pointer<IntPtr> newString),
          int Function(int string, int trimString,
              Pointer<IntPtr> newString)>('WindowsTrimStringEnd');
  return _WindowsTrimStringEnd(string, trimString, newString);
}

/// Removes all leading occurrences of a specified set of characters from
/// the source string.
///
/// ```c
/// HRESULT WindowsTrimStringStart(
///   HSTRING string,
///   HSTRING trimString,
///   HSTRING *newString
/// );
/// ```
/// {@category winrt}
int WindowsTrimStringStart(
    int string, int trimString, Pointer<IntPtr> newString) {
  final _WindowsTrimStringStart =
      _api_ms_win_core_winrt_string_l1_1_0.lookupFunction<
          Int32 Function(
              IntPtr string, IntPtr trimString, Pointer<IntPtr> newString),
          int Function(int string, int trimString,
              Pointer<IntPtr> newString)>('WindowsTrimStringStart');
  return _WindowsTrimStringStart(string, trimString, newString);
}
