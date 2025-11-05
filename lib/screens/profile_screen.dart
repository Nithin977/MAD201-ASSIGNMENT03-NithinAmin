/// Course: F2025 MAD201-01 Cross Platform Mobile Apps
/// Assignment 3 – Movie Explorer App
/// Author: Nithin Amin (A00194432)
/// Description: Profile screen: static user info + bio.

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            SizedBox(height: 12),
            Text('Nithin Amin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('A00194432 • nithin.amin@example.com'),
            SizedBox(height: 16),
            Text(
              'Aspiring cross‑platform mobile developer. Loves Flutter, movies, and clean UI.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
