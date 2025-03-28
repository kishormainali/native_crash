import 'package:flutter/material.dart';
import 'package:native_crash/native_crash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  crashOnDevMode(
    () => runApp(const DevModeApp()),
    onDevModeDetected: () {
      runApp(const DevModeApp());
    },
  );
}

class DevModeApp extends StatelessWidget {
  const DevModeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dev Mode Detected')),
        body: const Center(
          child: Text('You have enabled developer mode on your device.'),
        ),
      ),
    );
  }
}
