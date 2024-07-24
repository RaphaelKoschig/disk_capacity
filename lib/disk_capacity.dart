import 'disk_capacity_platform_interface.dart';

class DiskCapacity {
  /// Returns the total free space in megaoctets (Mo) available on the device.
  Future<double> getFreeDiskSpace() {
    return DiskCapacityPlatform.instance.getFreeDiskSpace();
  }

  /// Returns the total disk space in megaoctets (Mo) on the device.
  Future<double> getTotalDiskSpace() {
    return DiskCapacityPlatform.instance.getTotalDiskSpace();
  }

  /// Returns the free space in megaoctets (Mo) available for a specific path.
  Future<double> getFreeDiskSpaceForPath(String path) {
    return DiskCapacityPlatform.instance.getFreeDiskSpaceForPath(path);
  }

  /// Returns the total space in megaoctets (Mo) available for a specific path.
  Future<double> getTotalDiskSpaceForPath(String path) {
    return DiskCapacityPlatform.instance.getTotalDiskSpaceForPath(path);
  }
}
