import 'package:flutter_test/flutter_test.dart';
import 'package:native_crash/native_crash.dart';
import 'package:native_crash/native_crash_method_channel.dart';
import 'package:native_crash/native_crash_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeCrashPlatform
    with MockPlatformInterfaceMixin
    implements NativeCrashPlatform {
  @override
  Future<void> crash([String? message]) {
    throw Exception('crash');
  }

  @override
  Future<bool> checkDevMode() async {
    return false;
  }

  @override
  Future<bool> checkEmulator() async {
    return false;
  }

  @override
  Future<bool> checkJailBreak({bool enableLogging = false}) async {
    return false;
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

  test('checkJailBreak', () async {
    MockNativeCrashPlatform fakePlatform = MockNativeCrashPlatform();
    NativeCrashPlatform.instance = fakePlatform;
    expect(await NativeCrash.checkJailBreak(), false);
  });

  test('checkDevMode', () async {
    MockNativeCrashPlatform fakePlatform = MockNativeCrashPlatform();
    NativeCrashPlatform.instance = fakePlatform;
    expect(await NativeCrash.checkDevMode(), false);
  });

  test('checkEmulator', () async {
    MockNativeCrashPlatform fakePlatform = MockNativeCrashPlatform();
    NativeCrashPlatform.instance = fakePlatform;
    expect(await NativeCrash.checkEmulator(), false);
  });
}
