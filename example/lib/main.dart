import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:disk_capacity/disk_capacity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _freeDiskSpace = 0.0;
  double _totalDiskSpace = 0.0;
  String _error = '';
  final _DiskCapacityPlugin = DiskCapacity();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    double freeDiskSpace = 0.0;
    double totalDiskSpace = 0.0;

    try {
      freeDiskSpace = await _DiskCapacityPlugin.getFreeDiskSpace();
      totalDiskSpace = await _DiskCapacityPlugin.getTotalDiskSpace();
    } on PlatformException {
      setState(() {
        _error = 'Failed to get disk space.';
      });
    }

    setState(() {
      _freeDiskSpace = freeDiskSpace;
      _totalDiskSpace = totalDiskSpace;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Free disk space: $_freeDiskSpace Mo'),
            Text('Total disk space: $_totalDiskSpace Mo'),
            if (_error.isNotEmpty) ...[
              Text(_error),
              const SizedBox(height: 20.0),
            ],
          ],
        ),
      ),
    );
  }
}
