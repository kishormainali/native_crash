import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_crash_platform_interface.dart';

/// An implementation of [NativeCrashPlatform] that uses method channels.
class MethodChannelNativeCrash extends NativeCrashPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.kishormainali.native_crash');

  @override
  Future<void> crash() async {
    return await methodChannel.invokeMethod('crash');
  }
}
