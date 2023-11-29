import 'native_crash_platform_interface.dart';

/// {@template native_crash}
/// Dart interface for interacting with the native_crash plugin.
/// {@endtemplate}
class NativeCrash {
  const NativeCrash._();

  /// crash
  static Future<void> crash() {
    return NativeCrashPlatform.instance.crash();
  }
}
