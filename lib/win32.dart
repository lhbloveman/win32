// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: directives_ordering

/// Support for programming against the Win32 API on Windows operating systems.
///
/// This library provides a wrapper around many useful functions from the API,
/// along with the necessary constants and structs that are supplied. With
/// thousands of APIs and interfaces in the Win32 API, many of which cover areas
/// that would be unlikely to be useful to a Dart or Flutter developer, this
/// library is not intended to be exhaustive. Instead, we focus on the core
/// Win32 APIs that are typically used for Windows development, along with
/// Win32, COM and Windows Runtime APIs that are likely to be wrapped by a
/// Flutter plugin author.
///
/// Win32 is at its heart a C-based API, and accordingly adopts the style and
/// idioms of that language, including heavy usage of pointers, structs
/// allocated on the heap, and null-terminated strings. As a result, you may
/// choose to wrap the exposed APIs in your application to make their invocation
/// more idiomatic for a Dart consumer.
///
/// ## Strings (Win32 and COM)
///
/// Win32 strings are typically stored as null-terminated arrays of UTF-16 code
/// units. (Some Windows APIs also offer an ANSI 8-bit representation, or a
/// UTF-8 representation. but this library emphasizes the wide character
/// version, which in the original header files are suffixed with a capital 'W'
/// (e.g. `FormatMessageW`).
///
/// You can use the `toNativeUtf16` String extension function (import
/// `package:ffi`) to convert a Dart string into a `Pointer<Utf16>`, which can
/// be passed to any Windows API expecting a string, for example:
/// ```dart
///   final verb = 'open'.toNativeUtf16();
///   final process = 'notepad.exe'.toNativeUtf16();
///   ShellExecute(0, verb, process, nullptr, nullptr, SW_SHOW);
/// ```
///
/// Note that it is your responsibility to release the memory used when you are
/// finished with it.
///
/// To receive a string, allocate memory with a command like the following:
/// ```dart
///   final buffer = wsalloc(length);
///   GetWindowText(hWnd, buffer, length);
/// ```
///
/// This allocates an array of `length` UTF-16 code units. The cast is necessary
/// because Utf16 has no length of itself. The returned value can be converted
/// back to a Dart string using an extension method on Pointer<Utf16>, as
/// follows:
/// ```dart
///   print(buffer.toDartString());
/// ```
///
/// A small number of APIs offer no wide version (e.g. `GetProcAddress`), and so
/// the `toANSI` method may be of use to convert a Dart string to a
/// `Pointer<Uint8>`, which represents this format:
/// ```dart
///   final ansi = convertToANSIString('Beep');
///   final pGetNativeSystemInfo = GetProcAddress(hModule, ansi);
///   ...
///   free(ansi);
/// ```
///
/// Automation interfaces and some COM methods take a different string type
/// (`BSTR`). The Win32 package supplies a [BSTR] class which wraps the memory
/// allocation functions needed to work with this string data type.
library win32;

// Core Win32 APIs, constants and macros
export 'src/bstr.dart';
export 'src/callbacks.dart';
export 'src/constants.dart';
export 'src/constants_nodoc.dart';
export 'src/exceptions.dart';
export 'src/guid.dart';
export 'src/macros.dart';
export 'src/structs.g.dart'
    hide
        addrinfo,
        fd_set,
        IN_ADDR,
        SOCKADDR,
        timeval,
        hostent,
        protoent,
        servent;
export 'src/variant.dart';
export 'src/utils.dart';

// Useful extension methods
export 'src/extensions/dialogs.dart';
export 'src/extensions/int_to_hexstring.dart';
export 'src/extensions/list_to_blob.dart';
export 'src/extensions/set_ansi.dart';
export 'src/extensions/set_string.dart';
export 'src/extensions/set_string_array.dart';
export 'src/extensions/unpack_utf16.dart';

// Traditional C-style Windows APIs
export 'src/advapi32.dart';
export 'src/bluetoothapis.dart';
export 'src/bthprops.dart';
export 'src/comctl32.dart';
export 'src/comdlg32.dart';
export 'src/dbghelp.dart';
export 'src/dwmapi.dart';
export 'src/dxva2.dart';
export 'src/gdi32.dart';
export 'src/inline.dart';
export 'src/iphlpapi.dart';
export 'src/kernel32.dart';
export 'src/kernelbase.dart';
export 'src/magnification.dart';
export 'src/ole32.dart';
export 'src/oleaut32.dart';
export 'src/powrprof.dart';
export 'src/rometadata.dart';
export 'src/scarddlg.dart';
export 'src/setupapi.dart';
export 'src/shcore.dart';
export 'src/shell32.dart';
export 'src/spoolss.dart';
export 'src/types.dart';
export 'src/xinput1_4.dart';
export 'src/user32.dart';
export 'src/uxtheme.dart';
export 'src/version.dart';
export 'src/winmm.dart';
export 'src/winscard.dart';
export 'src/winspool.dart';
export 'src/wlanapi.dart';

export 'src/api_ms_win_core_apiquery_l2_1_0.dart';
export 'src/api_ms_win_core_winrt_l1_1_0.dart';
export 'src/api_ms_win_core_winrt_string_l1_1_0.dart';
export 'src/api_ms_win_ro_typeresolution_l1_1_0.dart';
export 'src/api_ms_win_wsl_api_l1_1_0.dart';

// COM and Windows Runtime foundational exports
export 'src/combase.dart';
export 'src/winrt_callbacks.dart';
export 'src/winrt_constants.dart';
export 'src/winrt_helpers.dart';

// COM interfaces
export 'src/com/iapplicationactivationmanager.dart';
export 'src/com/iappxfactory.dart';
export 'src/com/iappxfile.dart';
export 'src/com/iappxfilesenumerator.dart';
export 'src/com/iappxmanifestapplication.dart';
export 'src/com/iappxmanifestapplicationsenumerator.dart';
export 'src/com/iappxmanifestospackagedependency.dart';
export 'src/com/iappxmanifestpackagedependenciesenumerator.dart';
export 'src/com/iappxmanifestpackagedependency.dart';
export 'src/com/iappxmanifestpackageid.dart';
export 'src/com/iappxmanifestproperties.dart';
export 'src/com/iappxmanifestreader.dart';
export 'src/com/iappxmanifestreader2.dart';
export 'src/com/iappxmanifestreader3.dart';
export 'src/com/iappxmanifestreader4.dart';
export 'src/com/iappxmanifestreader5.dart';
export 'src/com/iappxmanifestreader6.dart';
export 'src/com/iappxmanifestreader7.dart';
export 'src/com/iappxpackagereader.dart';
export 'src/com/iaudiocaptureclient.dart';
export 'src/com/iaudioclient.dart';
export 'src/com/iaudioclock.dart';
export 'src/com/iaudiorenderclient.dart';
export 'src/com/iaudiosessioncontrol.dart';
export 'src/com/iaudiosessionmanager.dart';
export 'src/com/iaudiostreamvolume.dart';
export 'src/com/ibindctx.dart';
export 'src/com/ichannelaudiovolume.dart';
export 'src/com/iclassfactory.dart';
export 'src/com/iconnectionpoint.dart';
export 'src/com/iconnectionpointcontainer.dart';
export 'src/com/idesktopwallpaper.dart';
export 'src/com/idispatch.dart';
export 'src/com/ienumidlist.dart';
export 'src/com/ienummoniker.dart';
export 'src/com/ienumnetworkconnections.dart';
export 'src/com/ienumnetworks.dart';
export 'src/com/ienumresources.dart';
export 'src/com/ienumspellingerror.dart';
export 'src/com/ienumstring.dart';
export 'src/com/ienumvariant.dart';
export 'src/com/ienumwbemclassobject.dart';
export 'src/com/ierrorinfo.dart';
export 'src/com/ifiledialog.dart';
export 'src/com/ifiledialog2.dart';
export 'src/com/ifiledialogcustomize.dart';
export 'src/com/ifileisinuse.dart';
export 'src/com/ifileopendialog.dart';
export 'src/com/ifilesavedialog.dart';
export 'src/com/iinspectable.dart';
export 'src/com/iknownfolder.dart';
export 'src/com/iknownfoldermanager.dart';
export 'src/com/immdevice.dart';
export 'src/com/immdeviceenumerator.dart';
export 'src/com/imodalwindow.dart';
export 'src/com/imoniker.dart';
export 'src/com/inetwork.dart';
export 'src/com/inetworkconnection.dart';
export 'src/com/inetworklistmanager.dart';
export 'src/com/inetworklistmanagerevents.dart';
export 'src/com/ipersist.dart';
export 'src/com/ipersistfile.dart';
export 'src/com/ipersistmemory.dart';
export 'src/com/ipersiststream.dart';
export 'src/com/iprovideclassinfo.dart';
export 'src/com/irunningobjecttable.dart';
export 'src/com/isequentialstream.dart';
export 'src/com/ishellfolder.dart';
export 'src/com/ishellitem.dart';
export 'src/com/ishellitem2.dart';
export 'src/com/ishellitemarray.dart';
export 'src/com/ishellitemfilter.dart';
export 'src/com/ishellitemimagefactory.dart';
export 'src/com/ishellitemresources.dart';
export 'src/com/ishelllink.dart';
export 'src/com/ishelllinkdatalist.dart';
export 'src/com/ishelllinkdual.dart';
export 'src/com/ishellservice.dart';
export 'src/com/isimpleaudiovolume.dart';
export 'src/com/ispeventsource.dart';
export 'src/com/ispnotifysource.dart';
export 'src/com/ispvoice.dart';
export 'src/com/ispeechobjecttoken.dart';
export 'src/com/ispeechobjecttokens.dart';
export 'src/com/ispellchecker.dart';
export 'src/com/ispellchecker2.dart';
export 'src/com/ispellcheckerchangedeventhandler.dart';
export 'src/com/ispellcheckerfactory.dart';
export 'src/com/ispellingerror.dart';
export 'src/com/istream.dart';
export 'src/com/isupporterrorinfo.dart';
export 'src/com/itypeinfo.dart';
export 'src/com/iunknown.dart';
export 'src/com/iuri.dart';
export 'src/com/ivirtualdesktopmanager.dart';
export 'src/com/iwbemclassobject.dart';
export 'src/com/iwbemconfigurerefresher.dart';
export 'src/com/iwbemcontext.dart';
export 'src/com/iwbemhiperfenum.dart';
export 'src/com/iwbemlocator.dart';
export 'src/com/iwbemobjectaccess.dart';
export 'src/com/iwbemrefresher.dart';
export 'src/com/iwbemservices.dart';

// Windows Runtime classes and interfaces
export 'src/winrt/data/json/ijsonarray.dart';
export 'src/winrt/data/json/ijsonobject.dart';
export 'src/winrt/data/json/ijsonobjectwithdefaultvalues.dart';
export 'src/winrt/data/json/ijsonvalue.dart';
export 'src/winrt/data/json/jsonarray.dart';
export 'src/winrt/data/json/jsonobject.dart';
export 'src/winrt/data/json/jsonvalue.dart';
export 'src/winrt/data/xml/dom/ixmlnodelist.dart';
export 'src/winrt/devices/enumeration/devicepicker.dart';
export 'src/winrt/devices/enumeration/devicepickerfilter.dart';
export 'src/winrt/devices/enumeration/idevicepicker.dart';
export 'src/winrt/devices/enumeration/idevicepickerfilter.dart';
export 'src/winrt/devices/sensors/ipedometerreading.dart';
export 'src/winrt/devices/sensors/pedometerreading.dart';
export 'src/winrt/foundation/collections/iiterable.dart';
export 'src/winrt/foundation/collections/iiterator.dart';
export 'src/winrt/foundation/collections/ikeyvaluepair.dart';
export 'src/winrt/foundation/collections/imap.dart';
export 'src/winrt/foundation/collections/imapview.dart';
export 'src/winrt/foundation/collections/ivector.dart';
export 'src/winrt/foundation/collections/ivectorview.dart';
export 'src/winrt/foundation/collections/propertyset.dart';
export 'src/winrt/foundation/collections/stringmap.dart';
export 'src/winrt/foundation/collections/valueset.dart';
export 'src/winrt/foundation/iasyncaction.dart';
export 'src/winrt/foundation/iasyncinfo.dart';
export 'src/winrt/foundation/iasyncoperation.dart';
export 'src/winrt/foundation/ipropertyvalue.dart';
export 'src/winrt/foundation/propertyvalue.dart';
export 'src/winrt/gaming/input/gamepad.dart';
export 'src/winrt/gaming/input/igamecontroller.dart';
export 'src/winrt/gaming/input/igamecontrollerbatteryinfo.dart';
export 'src/winrt/gaming/input/igamepad.dart';
export 'src/winrt/globalization/calendar.dart';
export 'src/winrt/globalization/icalendar.dart';
export 'src/winrt/globalization/phonenumberformatting/iphonenumberformatter.dart';
export 'src/winrt/globalization/phonenumberformatting/phonenumberformatter.dart';
export 'src/winrt/graphics/printing3d/iprinting3dmultiplepropertymaterial.dart';
export 'src/winrt/graphics/printing3d/printing3dmultiplepropertymaterial.dart';
export 'src/winrt/media/mediaproperties/mediapropertyset.dart';
export 'src/winrt/networking/connectivity/inetworkinformationstatics.dart';
export 'src/winrt/networking/ihostname.dart';
export 'src/winrt/storage/applicationdata.dart';
export 'src/winrt/storage/iapplicationdata.dart';
export 'src/winrt/storage/istorageitem.dart';
export 'src/winrt/storage/iuserdatapathsstatics.dart';
export 'src/winrt/storage/pickers/ifileopenpicker.dart';
export 'src/winrt/storage/userdatapaths.dart';
export 'src/winrt/ui/notifications/itoastnotificationfactory.dart';
export 'src/winrt/ui/notifications/itoastnotificationmanagerstatics.dart';
export 'src/winrt/ui/notifications/toastnotification.dart';

// Windows Runtime Enumerations
export 'src/winrt/data/json/enums.g.dart';
export 'src/winrt/devices/enumeration/enums.g.dart';
export 'src/winrt/devices/sensors/enums.g.dart';
export 'src/winrt/foundation/enums.g.dart';
export 'src/winrt/gaming/input/enums.g.dart';
export 'src/winrt/globalization/enums.g.dart';
export 'src/winrt/globalization/phonenumberformatting/enums.g.dart';
export 'src/winrt/networking/enums.g.dart';
export 'src/winrt/storage/enums.g.dart';
export 'src/winrt/storage/pickers/enums.g.dart';
export 'src/winrt/ui/notifications/enums.g.dart';
export 'src/winrt/ui/popups/enums.g.dart';

// Windows Runtime Structs
export 'src/winrt/foundation/structs.g.dart';
export 'src/winrt/foundation/numerics/structs.g.dart';
export 'src/winrt/gaming/input/structs.g.dart';
