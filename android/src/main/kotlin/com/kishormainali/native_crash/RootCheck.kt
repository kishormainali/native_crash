package com.kishormainali.native_crash

import android.content.Context
import com.scottyab.rootbeer.RootBeer
import java.io.File

object RootCheck {

    /*
    * Check if the device is rooted
     */
    fun checkRooted(context: Context, enableLogging: Boolean): Boolean {
        return checkWithRootBeer(context, enableLogging) || checkWithPaths() || checkWithProcess()
    }


    private fun checkWithRootBeer(context: Context, enableLogging: Boolean): Boolean {
        val rootBeer = RootBeer(context)
        rootBeer.setLogging(enableLogging)
        return rootBeer.isRooted
    }

    private fun checkWithPaths(): Boolean {
        val paths: Array<String> = arrayOf(
            "/system/app/Superuser.apk",
            "/sbin/su",
            "/system/bin/su",
            "/system/xbin/su",
            "/data/local/xbin/su",
            "/data/local/bin/su",
            "/system/sd/xbin/su",
            "/system/bin/failsafe/su",
            "/data/local/su"
        )
        for (path in paths) if (File(path).exists()) return true
        return false
    }

    private fun checkWithProcess(): Boolean {
        var process: Process? = null
        return try {
            process = Runtime.getRuntime().exec(arrayOf("/system/xbin/which", "su"))
            val bufferedReader = process.inputStream.bufferedReader()
            bufferedReader.readLine() != null
        } catch (t: Throwable) {
            false
        } finally {
            process?.destroy()
        }
    }

}