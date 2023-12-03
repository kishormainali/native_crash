# native_crash

A Flutter plugin to simulate native crash. Also can be used to check jailbreak/root/debug/emulator status.

## Getting Started

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  native_crash: latest
```

## Usage

```dart
import 'package:native_crash/native_crash.dart';

// Simulate a native crash.
void crash() {
  NativeCrash.crash();
}
```

## Check if device is rooted/jailbroken

```dart
import 'package:native_crash/native_crash.dart';

// Check if device is rooted/jailbroken.
bool isJailBroken = await NativeCrash.checkJailBreak();
```

## Check if device is debuggable

```dart
import 'package:native_crash/native_crash.dart';

// Check if device has developer mode enabled.
bool isDevMode = await NativeCrash.checkDevMode();
```


## Check if device is emulator

```dart
import 'package:native_crash/native_crash.dart';

// Check if device is emulator.
bool isEmulator = await NativeCrash.checkEmulator();
```


## Crash app when device is rooted/jailbroken


```dart
import 'package:native_crash/native_crash.dart';
 void main() {
   WidgetsFlutterBinding.ensureInitialized();
   crashOnJailBreak(
     () async {
       runApp(MyApp());
     },
   );
 }
```

##  Crash app when device has developer mode enabled

```dart
import 'package:native_crash/native_crash.dart';
 void main() {
   WidgetsFlutterBinding.ensureInitialized();
   crashOnDevMode(
     () async {
       runApp(MyApp());
     },
   );
 }
```

## Crash app when device is emulator

```dart
import 'package:native_crash/native_crash.dart';
 void main() {
   WidgetsFlutterBinding.ensureInitialized();
   crashOnEmulator(
     () async {
       runApp(MyApp());
     },
   );
 }
```

