import 'package:esp32_temp_humid/models/device.dart';
import 'package:flutter/material.dart';

class ActiveDevices{
  final List<Device> livingRoomDevices = [
    Device(name: "Lights", icon: Icons.light_mode_outlined, status: false),
    Device(name: "AC", icon: Icons.air, status: false),
    Device(name: "Fan", icon: Icons.mode_fan_off_outlined, status: false),
    Device(name: "Smart TV", icon: Icons.tv, status: false),
  ];

  final List<Device> bedroomDevices = [
    Device(name: "Lights", icon: Icons.light_mode_outlined, status: false),
    Device(name: "AC", icon: Icons.air, status: false),
    Device(name: "Fan", icon: Icons.mode_fan_off_outlined, status: false),
  ];

  final List<Device> kitchenDevices = [
    Device(name: "Lights", icon: Icons.light_mode_outlined, status: false),
    Device(name: "AC", icon: Icons.air, status: false),
  ];
}


// DeviceCard(deviceName: 'Lights',deviceIcon: Icons.light_mode_outlined),
// DeviceCard(deviceName: 'AC',deviceIcon: Icons.air),
// DeviceCard(deviceName: 'Fan',deviceIcon: Icons.mode_fan_off_outlined),
// DeviceCard(deviceName: 'Smart TV',deviceIcon: Icons.screenshot_monitor),