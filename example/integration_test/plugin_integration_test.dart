// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:disk_capacity/disk_capacity.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getFreeDiskSpace', (WidgetTester tester) async {
    final DiskCapacity plugin = DiskCapacity();
    final double freeDiskSpace = await plugin.getFreeDiskSpace();

    expect(freeDiskSpace, greaterThan(0.0));
  });

  testWidgets('getTotalDiskSpace', (WidgetTester tester) async {
    final DiskCapacity plugin = DiskCapacity();
    final double totalDiskSpace = await plugin.getTotalDiskSpace();

    expect(totalDiskSpace, greaterThan(0.0));
  });

  testWidgets('getFreeDiskSpaceForPath', (WidgetTester tester) async {
    final DiskCapacity plugin = DiskCapacity();
    final double freeDiskSpace =
        await plugin.getFreeDiskSpaceForPath('/disk/emulated/0');

    expect(freeDiskSpace, greaterThan(0.0));
  });

  testWidgets('getTotalDiskSpaceForPath', (WidgetTester tester) async {
    final DiskCapacity plugin = DiskCapacity();
    final double totalDiskSpace =
        await plugin.getTotalDiskSpaceForPath('/disk/emulated/0');

    expect(totalDiskSpace, greaterThan(0.0));
  });
}
