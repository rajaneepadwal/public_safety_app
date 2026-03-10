import 'package:flutter/material.dart';
import 'track_me_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String name = "User"; // later load from Firestore

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Public Safety"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Welcome, $name",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Emergency Helplines",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Police\n100"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Ambulance\n108"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Women\n1091"),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TrackMeScreen(),
                  ),
                );
              },
              child: const Text("Track Me"),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                // navigate to report screen
              },
              child: const Text("Report Incident"),
            ),

          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            )
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                // SOS history
              },
            ),

            IconButton(
              icon: const Icon(Icons.groups),
              onPressed: () {
                // community screen
              },
            ),

            IconButton(
              icon: const Icon(
                Icons.home,
                size: 32,
                color: Colors.red,
              ),
              onPressed: () {},
            ),

            IconButton(
              icon: const Icon(Icons.report),
              onPressed: () {
                // reports screen
              },
            ),

            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // profile screen
              },
            ),

          ],
        ),
      ),
    );
  }
}