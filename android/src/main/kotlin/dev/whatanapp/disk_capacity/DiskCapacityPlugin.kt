package dev.whatanapp.disk_capacity

import androidx.annotation.NonNull
import android.os.Environment
import android.os.StatFs
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DiskCapacityPlugin */
class DiskCapacityPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "disk_capacity")
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
      when (call.method) {
          "getFreeDiskSpace" -> result.success(getFreeExternalDiskSpace())
          "getTotalDiskSpace" -> result.success(getTotalExternalDiskSpace())
          "getFreeDiskSpaceForPath" -> result.success(getFreeDiskSpaceForPath(call.argument<String>("path")!!))
          "getTotalDiskSpaceForPath" -> result.success(getTotalDiskSpaceForPath(call.argument<String>("path")!!))
          else -> result.notImplemented()
      }
  }

  private fun getFreeExternalDiskSpace(): Double {
      val stat = StatFs(Environment.getExternalStorageDirectory().path)
      val bytesAvailable = stat.blockSizeLong * stat.availableBlocksLong
      return (bytesAvailable / (1024f * 1024f)).toDouble()
  }

  private fun getTotalExternalDiskSpace(): Double {
      val stat = StatFs(Environment.getExternalStorageDirectory().path)
      val bytesTotal = stat.blockSizeLong * stat.blockCountLong
      return (bytesTotal / (1024f * 1024f)).toDouble()
  }

  private fun getFreeDiskSpaceForPath(path: String): Double {
      val stat = StatFs(path)
      val bytesAvailable = stat.blockSizeLong * stat.availableBlocksLong
      return (bytesAvailable / (1024f * 1024f)).toDouble()
  }

  private fun getTotalDiskSpaceForPath(path: String): Double {
      val stat = StatFs(path)
      val bytesTotal = stat.blockSizeLong * stat.blockCountLong
      return (bytesTotal / (1024f * 1024f)).toDouble()
  }
}
