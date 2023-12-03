import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_crash_method_channel.dart';

abstract class NativeCrashPlatform extends PlatformInterface {
  /// Constructs a NativeCrashPlatform.
  NativeCrashPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeCrashPlatform _instance = MethodChannelNativeCrash();

  /// The default instance of [NativeCrashPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeCrash].
  static NativeCrashPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeCrashPlatform] when
  /// they register themselves.
  static set instance(NativeCrashPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> crash([String? message]) {
    throw UnimplementedError('crash() has not been implemented.');
  }

  Future<bool> checkJailBreak({bool enableLogging = false}) {
    throw UnimplementedError('checkJailBreak() has not been implemented.');
  }

  Future<bool> checkDevMode() {
    throw UnimplementedError('checkDevMode() has not been implemented.');
  }

  Future<bool> checkEmulator() {
    throw UnimplementedError('checkEmulator() has not been implemented.');
  }
}
