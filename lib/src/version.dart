// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Maps FFI prototypes onto the corresponding Win32 API function calls

// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED DIRECTLY.

// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'callbacks.dart';
import 'com/combase.dart';
import 'structs.dart';

final _version = DynamicLibrary.open('version.dll');

/// Retrieves version information for the specified file.
///
/// ```c
/// BOOL GetFileVersionInfoExW(
///   DWORD   dwFlags,
///   LPCWSTR lpwstrFilename,
///   DWORD   dwHandle,
///   DWORD   dwLen,
///   LPVOID  lpData
/// );
/// ```
/// {@category version}
int GetFileVersionInfoEx(int dwFlags, Pointer<Utf16> lpwstrFilename,
    int dwHandle, int dwLen, Pointer lpData) {
  final _GetFileVersionInfoEx = _version.lookupFunction<
      Int32 Function(Uint32 dwFlags, Pointer<Utf16> lpwstrFilename,
          Uint32 dwHandle, Uint32 dwLen, Pointer lpData),
      int Function(int dwFlags, Pointer<Utf16> lpwstrFilename, int dwHandle,
          int dwLen, Pointer lpData)>('GetFileVersionInfoExW');
  return _GetFileVersionInfoEx(
      dwFlags, lpwstrFilename, dwHandle, dwLen, lpData);
}

/// Determines whether the operating system can retrieve version
/// information for a specified file. If version information is available,
/// GetFileVersionInfoSizeEx returns the size, in bytes, of that
/// information.
///
/// ```c
/// DWORD GetFileVersionInfoSizeExW(
///   DWORD   dwFlags,
///   LPCWSTR lpwstrFilename,
///   LPDWORD lpdwHandle
/// );
/// ```
/// {@category version}
int GetFileVersionInfoSizeEx(
    int dwFlags, Pointer<Utf16> lpwstrFilename, Pointer<Uint32> lpdwHandle) {
  final _GetFileVersionInfoSizeEx = _version.lookupFunction<
      Uint32 Function(Uint32 dwFlags, Pointer<Utf16> lpwstrFilename,
          Pointer<Uint32> lpdwHandle),
      int Function(int dwFlags, Pointer<Utf16> lpwstrFilename,
          Pointer<Uint32> lpdwHandle)>('GetFileVersionInfoSizeExW');
  return _GetFileVersionInfoSizeEx(dwFlags, lpwstrFilename, lpdwHandle);
}

/// Determines whether the operating system can retrieve version
/// information for a specified file. If version information is available,
/// GetFileVersionInfoSize returns the size, in bytes, of that information.
///
/// ```c
/// DWORD GetFileVersionInfoSizeW(
///   LPCWSTR lptstrFilename,
///   LPDWORD lpdwHandle
/// );
/// ```
/// {@category version}
int GetFileVersionInfoSize(
    Pointer<Utf16> lptstrFilename, Pointer<Uint32> lpdwHandle) {
  final _GetFileVersionInfoSize = _version.lookupFunction<
      Uint32 Function(
          Pointer<Utf16> lptstrFilename, Pointer<Uint32> lpdwHandle),
      int Function(Pointer<Utf16> lptstrFilename,
          Pointer<Uint32> lpdwHandle)>('GetFileVersionInfoSizeW');
  return _GetFileVersionInfoSize(lptstrFilename, lpdwHandle);
}

/// Retrieves version information for the specified file.
///
/// ```c
/// BOOL GetFileVersionInfoW(
///   LPCWSTR lptstrFilename,
///   DWORD   dwHandle,
///   DWORD   dwLen,
///   LPVOID  lpData
/// );
/// ```
/// {@category version}
int GetFileVersionInfo(
    Pointer<Utf16> lptstrFilename, int dwHandle, int dwLen, Pointer lpData) {
  final _GetFileVersionInfo = _version.lookupFunction<
      Int32 Function(Pointer<Utf16> lptstrFilename, Uint32 dwHandle,
          Uint32 dwLen, Pointer lpData),
      int Function(Pointer<Utf16> lptstrFilename, int dwHandle, int dwLen,
          Pointer lpData)>('GetFileVersionInfoW');
  return _GetFileVersionInfo(lptstrFilename, dwHandle, dwLen, lpData);
}

/// Determines where to install a file based on whether it locates another
/// version of the file in the system. The values VerFindFile returns in
/// the specified buffers are used in a subsequent call to the
/// VerInstallFile function.
///
/// ```c
/// DWORD VerFindFileW(
///   DWORD   uFlags,
///   LPCWSTR szFileName,
///   LPCWSTR szWinDir,
///   LPCWSTR szAppDir,
///   LPWSTR  szCurDir,
///   PUINT   puCurDirLen,
///   LPWSTR  szDestDir,
///   PUINT   puDestDirLen
/// );
/// ```
/// {@category version}
int VerFindFile(
    int uFlags,
    Pointer<Utf16> szFileName,
    Pointer<Utf16> szWinDir,
    Pointer<Utf16> szAppDir,
    Pointer<Utf16> szCurDir,
    Pointer<Uint32> puCurDirLen,
    Pointer<Utf16> szDestDir,
    Pointer<Uint32> puDestDirLen) {
  final _VerFindFile = _version.lookupFunction<
      Uint32 Function(
          Uint32 uFlags,
          Pointer<Utf16> szFileName,
          Pointer<Utf16> szWinDir,
          Pointer<Utf16> szAppDir,
          Pointer<Utf16> szCurDir,
          Pointer<Uint32> puCurDirLen,
          Pointer<Utf16> szDestDir,
          Pointer<Uint32> puDestDirLen),
      int Function(
          int uFlags,
          Pointer<Utf16> szFileName,
          Pointer<Utf16> szWinDir,
          Pointer<Utf16> szAppDir,
          Pointer<Utf16> szCurDir,
          Pointer<Uint32> puCurDirLen,
          Pointer<Utf16> szDestDir,
          Pointer<Uint32> puDestDirLen)>('VerFindFileW');
  return _VerFindFile(uFlags, szFileName, szWinDir, szAppDir, szCurDir,
      puCurDirLen, szDestDir, puDestDirLen);
}

/// Installs the specified file based on information returned from the
/// VerFindFile function. VerInstallFile decompresses the file, if
/// necessary, assigns a unique filename, and checks for errors, such as
/// outdated files.
///
/// ```c
/// DWORD VerInstallFileW(
///   DWORD   uFlags,
///   LPCWSTR szSrcFileName,
///   LPCWSTR szDestFileName,
///   LPCWSTR szSrcDir,
///   LPCWSTR szDestDir,
///   LPCWSTR szCurDir,
///   LPWSTR  szTmpFile,
///   PUINT   puTmpFileLen
/// );
/// ```
/// {@category version}
int VerInstallFile(
    int uFlags,
    Pointer<Utf16> szSrcFileName,
    Pointer<Utf16> szDestFileName,
    Pointer<Utf16> szSrcDir,
    Pointer<Utf16> szDestDir,
    Pointer<Utf16> szCurDir,
    Pointer<Utf16> szTmpFile,
    Pointer<Uint32> puTmpFileLen) {
  final _VerInstallFile = _version.lookupFunction<
      Uint32 Function(
          Uint32 uFlags,
          Pointer<Utf16> szSrcFileName,
          Pointer<Utf16> szDestFileName,
          Pointer<Utf16> szSrcDir,
          Pointer<Utf16> szDestDir,
          Pointer<Utf16> szCurDir,
          Pointer<Utf16> szTmpFile,
          Pointer<Uint32> puTmpFileLen),
      int Function(
          int uFlags,
          Pointer<Utf16> szSrcFileName,
          Pointer<Utf16> szDestFileName,
          Pointer<Utf16> szSrcDir,
          Pointer<Utf16> szDestDir,
          Pointer<Utf16> szCurDir,
          Pointer<Utf16> szTmpFile,
          Pointer<Uint32> puTmpFileLen)>('VerInstallFileW');
  return _VerInstallFile(uFlags, szSrcFileName, szDestFileName, szSrcDir,
      szDestDir, szCurDir, szTmpFile, puTmpFileLen);
}

/// Retrieves a description string for the language associated with a
/// specified binary Microsoft language identifier.
///
/// ```c
/// DWORD VerLanguageNameW(
///   DWORD  wLang,
///   LPWSTR szLang,
///   DWORD  cchLang
/// );
/// ```
/// {@category version}
int VerLanguageName(int wLang, Pointer<Utf16> szLang, int cchLang) {
  final _VerLanguageName = _version.lookupFunction<
      Uint32 Function(Uint32 wLang, Pointer<Utf16> szLang, Uint32 cchLang),
      int Function(
          int wLang, Pointer<Utf16> szLang, int cchLang)>('VerLanguageNameW');
  return _VerLanguageName(wLang, szLang, cchLang);
}

/// Retrieves specified version information from the specified
/// version-information resource. To retrieve the appropriate resource,
/// before you call VerQueryValue, you must first call the
/// GetFileVersionInfoSize function, and then the GetFileVersionInfo
/// function.
///
/// ```c
/// BOOL VerQueryValueW(
///   LPCVOID pBlock,
///   LPCWSTR lpSubBlock,
///   LPVOID  *lplpBuffer,
///   PUINT   puLen
/// );
/// ```
/// {@category version}
int VerQueryValue(Pointer pBlock, Pointer<Utf16> lpSubBlock,
    Pointer<Pointer> lplpBuffer, Pointer<Uint32> puLen) {
  final _VerQueryValue = _version.lookupFunction<
      Int32 Function(Pointer pBlock, Pointer<Utf16> lpSubBlock,
          Pointer<Pointer> lplpBuffer, Pointer<Uint32> puLen),
      int Function(
          Pointer pBlock,
          Pointer<Utf16> lpSubBlock,
          Pointer<Pointer> lplpBuffer,
          Pointer<Uint32> puLen)>('VerQueryValueW');
  return _VerQueryValue(pBlock, lpSubBlock, lplpBuffer, puLen);
}
