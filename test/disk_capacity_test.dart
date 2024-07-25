import 'package:flutter_test/flutter_test.dart';
import 'package:disk_capacity/disk_capacity.dart';
import 'package:disk_capacity/disk_capacity_platform_interface.dart';
import 'package:disk_capacity/disk_capacity_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDiskCapacityPlatform
    with MockPlatformInterfaceMixin
    implements DiskCapacityPlatform {
  @override
  Future<double> getFreeDiskSpace() => Future.value(42.0);

  @override
  Future<double> getTotalDiskSpace() => Future.value(42.0);

  @override
  Future<double> getFreeDiskSpaceForPath(String path) => Future.value(42.0);

  @override
  Future<double> getTotalDiskSpaceForPath(String path) => Future.value(42.0);
}

void main() {
  final DiskCapacityPlatform initialPlatform = DiskCapacityPlatform.instance;

  test('$MethodChannelDiskCapacity is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDiskCapacity>());
  });

  test('getFreeDiskSpace', () async {
    DiskCapacity diskCapacity = DiskCapacity();
    MockDiskCapacityPlatform fakePlatform = MockDiskCapacityPlatform();
    DiskCapacityPlatform.instance = fakePlatform;

    expect(await diskCapacity.getFreeDiskSpace(), 42.0);
  });

  test('getTotalDiskSpace', () async {
    DiskCapacity diskCapacity = DiskCapacity();
    MockDiskCapacityPlatform fakePlatform = MockDiskCapacityPlatform();
    DiskCapacityPlatform.instance = fakePlatform;

    expect(await diskCapacity.getTotalDiskSpace(), 42.0);
  });

  test('getFreeDiskSpaceForPath', () async {
    DiskCapacity diskCapacity = DiskCapacity();
    MockDiskCapacityPlatform fakePlatform = MockDiskCapacityPlatform();
    DiskCapacityPlatform.instance = fakePlatform;

    expect(await diskCapacity.getFreeDiskSpaceForPath('path'), 42.0);
  });

  test('getTotalDiskSpaceForPath', () async {
    DiskCapacity diskCapacity = DiskCapacity();
    MockDiskCapacityPlatform fakePlatform = MockDiskCapacityPlatform();
    DiskCapacityPlatform.instance = fakePlatform;

    expect(await diskCapacity.getTotalDiskSpaceForPath('path'), 42.0);
  });
}
