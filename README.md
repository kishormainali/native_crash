# native_crash

A Flutter plugin to simulate native crash.

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

