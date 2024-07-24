import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'disk_capacity_platform_interface.dart';

/// An implementation of [DiskCapacityPlatform] that uses method channels.
class MethodChannelDiskCapacity extends DiskCapacityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('disk_capacity');

  @override
  Future<double> getFreeDiskSpace() async {
    final freeSpace =
        await methodChannel.invokeMethod<double>('getFreeDiskSpace');
    return freeSpace!;
  }

  @override
  Future<double> getTotalDiskSpace() async {
    final totalSpace =
        await methodChannel.invokeMethod<double>('getTotalDiskSpace');
    return totalSpace!;
  }

  @override
  Future<double> getFreeDiskSpaceForPath(String path) async {
    final freeSpace = await methodChannel
        .invokeMethod<double>('getFreeDiskSpaceForPath', {'path': path});
    return freeSpace!;
  }

  @override
  Future<double> getTotalDiskSpaceForPath(String path) async {
    final totalSpace = await methodChannel
        .invokeMethod<double>('getTotalDiskSpaceForPath', {'path': path});
    return totalSpace!;
  }
}
