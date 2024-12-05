import 'package:esp32_temp_humid/tab_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleTabbar extends StatefulWidget {
  const SimpleTabbar({super.key});

  @override
  State<SimpleTabbar> createState() => _SimpleTabbarState();
}

class _SimpleTabbarState extends State<SimpleTabbar>{

  @override
  Widget build(BuildContext context) {
    final tabIndexProvider = Provider.of<TabIndexProvider>(context);
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[600],
            labelPadding: const EdgeInsets.only(right: 5),
            labelStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900,fontFamily:'Lexend'),
            unselectedLabelStyle:
            const TextStyle(fontSize: 15, fontWeight: FontWeight.w700,fontFamily:'Lexend'),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
            ),
            dividerColor: Colors.transparent,
            onTap: (index){
                tabIndexProvider.setIndex(index);
            },
            tabs: const [
              Tab(
                  text: 'Living Room',
                ),
              Tab(text: 'Bedroom'),
              Tab(text: 'Kitchen'),
            ],
          ),
        ],
      ),
    );
  }
}
