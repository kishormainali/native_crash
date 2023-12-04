import Flutter
import UIKit
import IOSSecuritySuite

public class NativeCrashPlugin: NSObject, FlutterPlugin {

    private static let channelName = "com.kishormainali.native_crash"
    private static let methodCrash = "crash"
    private static let methodCheckJailBreak = "checkJailBreak"
    private static let methodCheckDevMode = "isDevMode"
    private static let methodCheckEmulator = "isEmulator"


    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())
        let instance = NativeCrashPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    fileprivate func isSimulator()-> Bool {
        let isSimulator = UIDevice.current.isSimulator
        let amSimulator = IOSSecuritySuite.amIRunInEmulator()
        return isSimulator || amSimulator
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        switch(call.method) {
        case NativeCrashPlugin.methodCrash:
            if let args = call.arguments as? [String: Any] {
                print(args)
                
                let message = args["message"] as? String
                try! crash(message: message)
                result(nil)
            }
            break
        case NativeCrashPlugin.methodCheckJailBreak:
            if isSimulator() {
                result(false)
            } else {
                let amJailbroken = IOSSecuritySuite.amIJailbroken()
                let amReverseEngineered = IOSSecuritySuite.amIReverseEngineered()
                result(amJailbroken || amReverseEngineered)
            }
            break
        case NativeCrashPlugin.methodCheckDevMode:
            let amDebugged = IOSSecuritySuite.amIDebugged()
            result(amDebugged)
            break
        case NativeCrashPlugin.methodCheckEmulator:
            result(isSimulator())
            break
        default:
            result(FlutterMethodNotImplemented)
            break
        }
    }
    private func crash(message: String?) throws {
        NSException(
            name: NSExceptionName(rawValue: "NativeCrashException"),
            reason: message ?? "This is a crash caused by calling .crash() in Dart.",
            userInfo:nil
        )
        .raise()
    }
}

extension UIDevice {
    var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}
