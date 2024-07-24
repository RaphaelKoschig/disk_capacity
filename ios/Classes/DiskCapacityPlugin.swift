import Flutter
import UIKit

public class DiskCapacityPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "disk_capacity", binaryMessenger: registrar.messenger())
    let instance = DiskCapacityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "getFreeDiskSpace":
          result(UIDevice.current.freeDiskSpaceInMB)
      case "getTotalDiskSpace":
          result(UIDevice.current.totalDiskSpaceInMB)
      case "getFreeDiskSpaceForPath":
          result(UIDevice.current.freeDiskSpaceForPathInMB(path: (call.arguments as? [String: String])!["path"]!))
      case "getTotalDiskSpaceForPath":
          result(UIDevice.current.totalDiskSpaceForPathInMB(path: (call.arguments as? [String: String])!["path"]!))
      default:
          result(FlutterMethodNotImplemented)
      }
  }
}


extension UIDevice {
    var totalDiskSpaceInMB: Double {
        return Double(totalDiskSpaceInBytes / (1024 * 1024))
    }

    var freeDiskSpaceInMB: Double {
        return Double(freeDiskSpaceInBytes / (1024 * 1024))
    }

    public func freeDiskSpaceForPathInMB(path: String) -> Double {
        return Double(freeDiskSpaceForPathInBytes(path: path) / (1024 * 1024))
    }

    public func totalDiskSpaceForPathInMB(path: String) -> Double {
        return Double(totalDiskSpaceForPathInBytes(path: path) / (1024 * 1024))
    }

    var totalDiskSpaceInBytes: Int64 {
        guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
              let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else { return 0 }
        return space
    }

    var freeDiskSpaceInBytes: Int64 {
        if #available(iOS 11.0, *) {
            if let space = try? URL(fileURLWithPath: NSHomeDirectory() as String).resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage {
                return space ?? 0
            } else {
                return 0
            }
        } else {
            if let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
               let freeSpace = (systemAttributes[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value {
                return freeSpace
            } else {
                return 0
            }
        }
    }

    public func freeDiskSpaceForPathInBytes(path: String) -> Int64 {
        if #available(iOS 11.0, *) {
            if let space = try? URL(fileURLWithPath: path).resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage {
                return space ?? 0
            } else {
                return 0
            }
        } else {
            if let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: path),
               let freeSpace = (systemAttributes[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value {
                return freeSpace
            } else {
                return 0
            }
        }
    }

    public func totalDiskSpaceForPathInBytes(path: String) -> Int64 {
        guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: path),
              let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else { return 0 }
        return space
        // if #available(iOS 11.0, *) {
        //     if let space = try? URL(fileURLWithPath: path).resourceValues(forKeys: [.volumeTotalCapacityKey]).volumeTotalCapacity.int64Value {
        //         return space ?? 0
        //     } else {
        //         return 0
        //     }
        // } 
    }
}