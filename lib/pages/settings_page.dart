import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:Setting()));
}

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Settings",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
      ),
      backgroundColor: Color.fromARGB(255, 249, 249, 249),
    );
  }
}


