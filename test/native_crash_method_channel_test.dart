import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_crash/native_crash_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelNativeCrash platform = MethodChannelNativeCrash();
  const MethodChannel channel = MethodChannel('com.kishormainali.native_crash');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'crash') {
          throw Exception('Native crash');
        } else if (methodCall.method == 'checkJailBreak') {
          return false;
        } else if (methodCall.method == 'isDevMode') {
          return false;
        } else if (methodCall.method == 'isEmulator') {
          return false;
        }
        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('crash', () async {
    expect(platform.crash(), throwsException);
  });

  test('checkJailBreak', () async {
    expect(await platform.checkJailBreak(), false);
  });

  test('checkDevMode', () async {
    expect(await platform.checkDevMode(), false);
  });

  test('checkEmulator', () async {
    expect(await platform.checkEmulator(), false);
  });
}
