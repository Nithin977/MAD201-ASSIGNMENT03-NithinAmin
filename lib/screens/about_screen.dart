/// Course: F2025 MAD201-01 Cross Platform Mobile Apps
/// Assignment 3 – Movie Explorer App
/// Author: Nithin Amin (A00194432)
/// Description: About screen: static app info.

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About App')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Movie Explorer demonstrates ListView, Drawer, BottomNavigation, and multi-screen navigation in Flutter.'),
      ),
    );
  }
}
