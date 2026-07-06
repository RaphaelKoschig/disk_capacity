# disk_capacity

[![pub package](https://img.shields.io/pub/v/disk_capacity.svg)](https://pub.dev/packages/disk_capacity)

A Flutter plugin to get free and total disk space on Android and iOS.

*This plugin is inspired by the [disk_space](https://pub.dev/packages/disk_space) package from Marvin Böddeker, no longer maintained.*

## Installation

Run:

```bash
flutter pub add disk_capacity
```

Or add the dependency manually to your package's `pubspec.yaml` file:

```yaml
dependencies:
  disk_capacity: ^1.2.0
```

## Usage

```dart
import 'package:disk_capacity/disk_capacity.dart';

void main() async {
    final DiskCapacity diskCapacity = DiskCapacity();
    double freeSpace = await diskCapacity.getFreeDiskSpace();
    double totalSpace = await diskCapacity.getTotalDiskSpace();
    double freeSpaceForPath = await diskCapacity.getFreeDiskSpaceForPath('/path/to/directory');
    double totalSpaceForPath = await diskCapacity.getTotalDiskSpaceForPath('/path/to/directory');

    print('Free space: $freeSpace MB');
    print('Total space: $totalSpace MB');
    print('Free space for path: $freeSpaceForPath MB');
    print('Total space for path: $totalSpaceForPath MB');
}
```

## API reference

| Method | Description |
|--------|-------------|
| `getFreeDiskSpace()` | Free space on the device storage |
| `getTotalDiskSpace()` | Total size of the device storage |
| `getFreeDiskSpaceForPath(String path)` | Free space on the volume containing `path` |
| `getTotalDiskSpaceForPath(String path)` | Total size of the volume containing `path` |

All values are returned in megabytes (MB). No permission is required on either platform.

### Good to know

* **The measured volume differs slightly between platforms.** On Android, `getFreeDiskSpace()` and `getTotalDiskSpace()` measure the shared/external storage (`Environment.getExternalStorageDirectory()`), while on iOS they measure the volume containing the app's home directory. On most modern devices both correspond to the main internal storage.
* **iOS free space includes purgeable space.** The value comes from `volumeAvailableCapacityForImportantUsage`, which counts space the system can reclaim on demand. It can therefore be higher than the "available" value shown in the Settings app.
* **Invalid paths.** When called with a path that does not exist or is not accessible, the `*ForPath` methods return `0` on iOS and throw a `PlatformException` on Android.

## Platform support

|             | Android | iOS   |
|-------------|---------|-------|
| **Version** | SDK 21+ | 12.0+ |

On Android, the plugin uses Flutter's built-in Kotlin support (AGP 9+ / Flutter 3.44+) and automatically falls back to the Kotlin Gradle Plugin on older AGP versions. On iOS, both Swift Package Manager and CocoaPods are supported.

### iOS privacy manifest

This plugin reads the device's disk space, which is a [required reason API](https://developer.apple.com/documentation/bundleresources/privacy_manifest_files/describing_use_of_required_reason_api) on iOS.
It ships with a `PrivacyInfo.xcprivacy` manifest declaring the `NSPrivacyAccessedAPICategoryDiskSpace` category (reasons `85F4.1` and `E174.1`), so no extra declaration is needed for the plugin itself in your app.

## Contributing
If you have any questions or ideas, please feel free to contact me or open an issue to discuss it.

## License
This project is licensed under the [MIT License](LICENSE).
