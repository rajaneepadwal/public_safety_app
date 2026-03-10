import 'package:flutter/material.dart';

class TrackMeScreen extends StatelessWidget {
  const TrackMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Tracking"),
      ),

      body: const Center(
        child: Text(
          "Map tracking will appear here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}