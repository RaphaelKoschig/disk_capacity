# disk_capacity

A Flutter plugin to get free and total disk space on Android and iOS.

> [!NOTE]  
> This plugin is inspired by disk_space package from Marvin Böddeker, no longer maintained.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  disk_capacity: ^1.0.0
```

Then run 

```bash
flutter pub get
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

## Contributing
If you have any questions or ideas, please feel free to contact me or open an issue to discuss it.

## License
This project is licensed under the [MIT](LICENSE)