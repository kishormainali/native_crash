import 'package:flutter/material.dart';
import 'package:native_crash/native_crash.dart';
import 'package:native_crash_example/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  crashOnJailBreak(
    () => runApp(const App()),
    onRootJailBreakDetected: () {
      runApp(const JailBreakApp());
    },
  );
}

class JailBreakApp extends StatelessWidget {
  const JailBreakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('JailBreak Detected'),
        ),
        body: const Center(
          child: Text(
              'You are trying to run your app on a jail broken/rooted device.'),
        ),
      ),
    );
  }
}
