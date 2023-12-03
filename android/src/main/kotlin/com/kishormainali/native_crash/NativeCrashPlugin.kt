package com.kishormainali.native_crash

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** NativeCrashPlugin */
class NativeCrashPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var context: Context? = null

    private val channelName = "com.kishormainali.native_crash"
    private val methodCrash = "crash"
    private val methodCheckRooted = "checkJailBreak"
    private val methodIsDev = "isDevMode"
    private val methodIsEmulator = "isEmulator"


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, channelName)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            methodCrash -> {
                val message = call.argument<String?>("message")
                    ?: "This is a crash caused by calling .crash() in Dart."
                crash(message)
            }

            methodCheckRooted -> {
                val enableLogging = call.argument<Boolean?>("enableLogging") ?: false
                checkRooted(result, enableLogging)
            }

            methodIsDev -> checkDevMode(result)
            methodIsEmulator -> result.success(EmulatorCheck.isEmulator)
            else -> result.notImplemented()
        }
    }

    /*
    * Check if the device is in developer mode
     */
    private fun checkDevMode(result: MethodChannel.Result) {
        if (context == null) {
            result.error(
                "INIT", "Plugin is not initialized yet!!!", "Plugin is not initialized yet!!!"
            );
            return
        }
        val isDevMode = Settings.Global.getInt(
            context!!.contentResolver, Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0
        ) != 0
        result.success(isDevMode)
    }


    /*
    * Check if the device is rooted
     */
    private fun checkRooted(result: Result, enableLogging: Boolean) {
        if (context == null) {
            result.error(
                "INIT", "Plugin is not initialized yet!!!", "Plugin is not initialized yet!!!"
            );
            return
        }
        result.success(RootCheck.checkRooted(context!!, enableLogging))
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun crash(message: String) {
        Handler(Looper.getMainLooper()).postDelayed({
            throw NativeCrashException(message)
        }, 50)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        context = binding.activity.applicationContext
    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        context = binding.activity.applicationContext
    }

    override fun onDetachedFromActivity() {
        context = null
    }
}
