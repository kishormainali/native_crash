import 'package:flutter/material.dart';
import 'package:native_crash/native_crash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkRooted();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: const Column(
          children: [
            FilledButton(onPressed: NativeCrash.crash, child: Text('Crash')),
          ],
        ),
      ),
    );
  }

  void checkRooted() async {
    bool isRooted = await NativeCrash.checkJailBreak();
    debugPrint('isRooted: $isRooted');
    bool isDevMode = await NativeCrash.checkDevMode();
    debugPrint('isDevMode: $isDevMode');
    bool isSimulator = await NativeCrash.checkEmulator();
    debugPrint('isSimulator: $isSimulator');
  }
}
