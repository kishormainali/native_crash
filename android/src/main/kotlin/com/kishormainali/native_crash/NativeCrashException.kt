package com.kishormainali.native_crash

import androidx.annotation.Keep

@Keep
class NativeCrashException internal constructor(override val message: String) :
    RuntimeException(message) {
    init {
        fillInStackTrace()
    }
}