import 'package:flutter_test/flutter_test.dart';
import 'package:native_crash/native_crash.dart';
import 'package:native_crash/native_crash_method_channel.dart';
import 'package:native_crash/native_crash_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeCrashPlatform with MockPlatformInterfaceMixin implements NativeCrashPlatform {
  @override
  Future<void> crash() {
    throw Exception('crash');
  }
}

void main() {
  final NativeCrashPlatform initialPlatform = NativeCrashPlatform.instance;

  test('$MethodChannelNativeCrash is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeCrash>());
  });

  test('crash', () async {
    MockNativeCrashPlatform fakePlatform = MockNativeCrashPlatform();
    NativeCrashPlatform.instance = fakePlatform;
    expect(() => NativeCrash.crash(), throwsException);
  });
}
