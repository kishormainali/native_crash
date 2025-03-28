import 'package:example/app.dart';
import 'package:flutter/material.dart';
import 'package:native_crash/native_crash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  crashOnEmulator(
    () => runApp(const App()),
    onEmulatorDetected: () {
      runApp(const EmulatorApp());
    },
  );
}

class EmulatorApp extends StatelessWidget {
  const EmulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Emulator Detected')),
        body: const Center(
          child: Text('You are trying to run your app on an emulator.'),
        ),
      ),
    );
  }
}
