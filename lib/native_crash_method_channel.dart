import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_crash_platform_interface.dart';

/// An implementation of [NativeCrashPlatform] that uses method channels.
class MethodChannelNativeCrash extends NativeCrashPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.kishormainali.native_crash');

  @override
  Future<void> crash([String? message]) async {
    return await methodChannel.invokeMethod('crash', {
      'message': message ?? 'This message is thrown when crash() is called from dart side.',
    });
  }

  @override
  Future<bool> checkJailBreak({bool enableLogging = false}) async {
    return await methodChannel.invokeMethod('checkJailBreak', {
      'enableLogging': enableLogging,
    });
  }

  @override
  Future<bool> checkDevMode() async {
    return await methodChannel.invokeMethod('isDevMode');
  }

  @override
  Future<bool> checkEmulator() async {
    return await methodChannel.invokeMethod('isEmulator');
  }
}
