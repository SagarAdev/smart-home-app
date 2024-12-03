
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceCard extends StatefulWidget {
  final String deviceName;
  final IconData deviceIcon;
  const DeviceCard({super.key, required this.deviceName, required this.deviceIcon});

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 237, 237),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                    child: Icon(
                      widget.deviceIcon,
                      size: 50.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Text(
                      widget.deviceName,
                      style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 25,

                      ),
                    ),
                  ),
                ],
              ),
              Switch(
                activeTrackColor: Colors.black,
                activeColor:  const Color.fromARGB(255, 249, 249, 249),
                inactiveTrackColor: const Color.fromARGB(255, 249, 249, 249),
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value; // Update the switch state
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

