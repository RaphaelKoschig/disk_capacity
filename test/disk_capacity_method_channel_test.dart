import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:disk_capacity/disk_capacity_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelDiskCapacity platform = MethodChannelDiskCapacity();
  const MethodChannel channel = MethodChannel('disk_capacity');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return 42.0;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getFreeDiskSpace', () async {
    expect(await platform.getFreeDiskSpace(), 42.0);
  });

  test('getTotalDiskSpace', () async {
    expect(await platform.getTotalDiskSpace(), 42.0);
  });

  test('getFreeDiskSpaceForPath', () async {
    expect(await platform.getFreeDiskSpaceForPath('path'), 42.0);
  });

  test('getTotalDiskSpaceForPath', () async {
    expect(await platform.getTotalDiskSpaceForPath('path'), 42.0);
  });
}
