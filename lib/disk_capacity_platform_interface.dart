import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'disk_capacity_method_channel.dart';

abstract class DiskCapacityPlatform extends PlatformInterface {
  /// Constructs a DiskCapacityPlatform.
  DiskCapacityPlatform() : super(token: _token);

  static final Object _token = Object();

  static DiskCapacityPlatform _instance = MethodChannelDiskCapacity();

  /// The default instance of [DiskCapacityPlatform] to use.
  ///
  /// Defaults to [MethodChannelDiskCapacity].
  static DiskCapacityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DiskCapacityPlatform] when
  /// they register themselves.
  static set instance(DiskCapacityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<double> getFreeDiskSpace() {
    throw UnimplementedError(
        'getFreeExternalDiskSpace() has not been implemented.');
  }

  Future<double> getTotalDiskSpace() {
    throw UnimplementedError(
        'getTotalExternalDiskSpace() has not been implemented.');
  }

  Future<double> getFreeDiskSpaceForPath(String path) {
    throw UnimplementedError(
        'getFreeDiskSpaceForPath() has not been implemented.');
  }

  Future<double> getTotalDiskSpaceForPath(String path) {
    throw UnimplementedError(
        'getTotalDiskSpaceForPath() has not been implemented.');
  }
}
