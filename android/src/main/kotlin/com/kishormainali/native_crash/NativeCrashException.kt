package com.kishormainali.native_crash

import androidx.annotation.Keep

@Keep
class NativeCrashException internal constructor() :
    RuntimeException("This is a crash caused by calling .crash() in Dart.") {
    init {
        fillInStackTrace()
    }
}