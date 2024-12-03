import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'device_card.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esp32_temp_humid/services/firestore.dart';
import 'sensorDataCard.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Smart Home',
      home: MyHomePage(title: 'Smart Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  firestoreService firestore = firestoreService();

  String _temperature = "?";
  String _humidity = "?";
  late Future<QuerySnapshot> _latestData;

  Random random = Random();

  void fetchData() async {
    firestore.addData((random.nextDouble() * 50).toStringAsFixed(2),
        (random.nextDouble() * 70).toStringAsFixed(0));

    try {
      QuerySnapshot snapshot = await firestoreService().getData();
      List<Map<String, dynamic>> documents = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      setState(() {
        _temperature = "${documents.first['temp']}°C";
        _humidity = "${documents.first['humid']} %";
      });
    } on Exception catch (e) {
      // TODO
      print("Exception:${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        appBar: AppBar(
          title: const Text(
            "Smart Home",
            style: TextStyle(
              fontFamily: 'Lexend',
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  size: 30.0,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
        ),
        body: Center(
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 2,
                      ),
                      itemCount: 2, // Two cards for Temperature and Humidity
                      shrinkWrap:
                          true, // Ensures GridView doesn't expand unnecessarily
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return DataCard(
                            dataTitle: "Temperature",
                            dataValue: _temperature,
                            dataIcon: Icons.device_thermostat_outlined,
                          );
                        } else {
                          return DataCard(
                            dataTitle: "Humidity",
                            dataValue: _humidity,
                            dataIcon: Icons.water_drop_outlined,
                          );
                        }
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black
                        ),
                        onPressed:fetchData,
                        child: const Text(
                          "Refresh",
                          style: TextStyle(
                            fontFamily: 'Lexend',
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        )
                    ),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Living Room",
                              style: TextStyle(
                                fontSize: 23.0,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.bold,
                              )),
                          Text("Bedroom",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,

                              )),
                          Text("Kitchen",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
                              )),
                        ],
                      ),
                      DeviceCard(deviceName: 'Lights',deviceIcon: Icons.light_mode_outlined),
                      DeviceCard(deviceName: 'AC',deviceIcon: Icons.air),
                      DeviceCard(deviceName: 'Fan',deviceIcon: Icons.mode_fan_off_outlined),
                      DeviceCard(deviceName: 'Smart TV',deviceIcon: Icons.screenshot_monitor),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ))
                ],
              )),
        ));
  }
}



