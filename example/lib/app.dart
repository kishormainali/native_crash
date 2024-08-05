import 'package:flutter/material.dart';
import 'package:native_crash/native_crash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Column(
          children: [
            FilledButton(
              onPressed: NativeCrash.crash,
              child: Text('Crash'),
            ),
          ],
        ),
      ),
    );
  }
}
