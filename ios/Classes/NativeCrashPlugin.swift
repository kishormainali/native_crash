import Flutter
import UIKit

public class NativeCrashPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.kishormainali.native_crash", binaryMessenger: registrar.messenger())
    let instance = NativeCrashPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "crash") {
      try! crash()
      result(nil)
    } else{
      result(FlutterMethodNotImplemented)
    }
  }
  private func crash() throws {
    NSException(
            name: NSExceptionName(rawValue: "NativeCrashException"),
            reason:"This is a crash caused by calling .crash() in Dart.",
            userInfo:nil
          )
          .raise()
  }
}
