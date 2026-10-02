package com.kishormainali.native_crash

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlin.test.Test
import org.mockito.Mockito

/*
 * Run from the command line with `./gradlew :native_crash:testDebugUnitTest`
 * in the `example/android/` directory (after building the example app once).
 */

internal class NativeCrashPluginTest {
  @Test
  fun onMethodCall_unknownMethod_returnsNotImplemented() {
    val plugin = NativeCrashPlugin()

    val call = MethodCall("unknownMethod", null)
    val mockResult: MethodChannel.Result = Mockito.mock(MethodChannel.Result::class.java)
    plugin.onMethodCall(call, mockResult)

    Mockito.verify(mockResult).notImplemented()
  }
}
