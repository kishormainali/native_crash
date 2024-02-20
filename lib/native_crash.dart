import 'dart:async';

import 'package:flutter/foundation.dart';

import 'native_crash_platform_interface.dart';

/// {@template native_crash}
/// Dart interface for interacting with the native_crash plugin.
/// {@endtemplate}
class NativeCrash {
  const NativeCrash._();

  /// crash
  static Future<void> crash([String? message]) {
    return NativeCrashPlatform.instance.crash(message);
  }

  /// checkJailBreak
  static Future<bool> checkJailBreak({bool enableLogging = false}) {
    return NativeCrashPlatform.instance.checkJailBreak(enableLogging: enableLogging);
  }

  /// checkDevMode
  static Future<bool> checkDevMode() {
    return NativeCrashPlatform.instance.checkDevMode();
  }

  /// checkEmulator
  static Future<bool> checkEmulator() {
    return NativeCrashPlatform.instance.checkEmulator();
  }
}

/// {@template crash_on_jail_break}
/// This will kill your app when the device is jail broken or rooted.
///
/// call this method in main method of your app.
///
/// ```dart
/// void main() {
///   WidgetsFlutterBinding.ensureInitialized();
///   crashOnJailBreak(
///     () async {
///       runApp(MyApp());
///     },
///   );
/// }
/// ```
/// {@endtemplate}
Future<void> crashOnJailBreak(FutureOr<void> Function() builder) async {
  bool isRooted = await NativeCrash.checkJailBreak();
  if (isRooted && kReleaseMode) {
    await NativeCrash.crash('You are trying to run your app on a jail broken/rooted device.');
    return;
  }
  await builder();
}

/// {@template crash_on_dev_mode}
/// This will kill your app when the device is in dev mode.
///
/// call this method in main method of your app.
///
/// ```dart
/// void main() {
///   WidgetsFlutterBinding.ensureInitialized();
///   crashOnDevMode(
///     () async {
///       runApp(MyApp());
///     },
///   );
/// }
/// ```
/// {@endtemplate}
Future<void> crashOnDevMode(FutureOr<void> Function() builder) async {
  bool isDevMode = await NativeCrash.checkDevMode();
  if (isDevMode && kReleaseMode) {
    await NativeCrash.crash('You have enabled developer mode on your device.');
    return;
  }
  await builder();
}

/// {@template crash_on_emulator}
/// This will kill your app when the device is an emulator.
///
/// call this method in main method of your app.
///
/// ```dart
/// void main() {
///   WidgetsFlutterBinding.ensureInitialized();
///   crashOnEmulator(
///     () async {
///       runApp(MyApp());
///     },
///   );
/// }
/// ```
/// {@endtemplate}
Future<void> crashOnEmulator(FutureOr<void> Function() builder) async {
  bool isSimulator = await NativeCrash.checkEmulator();
  if (isSimulator && kReleaseMode) {
    await NativeCrash.crash('You are running you app on Simulator/Emulator.');
    return;
  }
  await builder();
}
