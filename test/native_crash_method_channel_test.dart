import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_crash/native_crash_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelNativeCrash platform = MethodChannelNativeCrash();
  const MethodChannel channel = MethodChannel('com.kishormainali.native_crash');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        throw Exception('Native crash');
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('crash', () async {
    expect(platform.crash(), throwsException);
  });
}
