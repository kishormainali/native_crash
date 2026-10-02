## 2.0.0
- **BREAKING:** removed CocoaPods support (podspec deleted); iOS now requires Swift Package Manager
- **BREAKING:** requires Flutter >=3.47.0 and Dart >=3.13.0; Android minSdk is now 24
- android: AGP 9.1.0, Gradle 9.3.1, Kotlin 2.4.0, compileSdk 36, Java 17
- android: updated rootbeer to 0.1.2 for 16 KB page size support
- ios: IOSSecuritySuite 2.3.0, added FlutterFramework package dependency
- updated example project and replaced stale unit test

## 1.3.1
- fix ios build issue

## 1.3.0
- migrated ios implementation to Swift Package Manager
- migrate android implementation to latest flutter plugin template
- updated example project

## 1.2.1

- deps update

## 1.2.0

- added support for showing custom widget when emulator/root/jailbreak/developer mode detected.
- dependency updates

## 1.1.2

- dependency updates
- updated android compileSdkVersion to 34
- updated android minSdkVersion to 23

## 1.1.1

- fix ios build issue

## 1.1.0

- added `jailbreak` or `root` detection.
- added optional `message` parameter to crash() method.

## 1.0.0

- initial release.
