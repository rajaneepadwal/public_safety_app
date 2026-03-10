import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void saveUser() async {

    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Please fill all fields")),
    );
    return;
    }

    if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Passwords do not match")),
    );
    return;
    }

    try {

    final user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .set({
    "name": name,
    "email": email,
    "password": password,
    "phone": user.phoneNumber,
    "createdAt": FieldValue.serverTimestamp(),
    });

    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
    builder: (context) => const HomeScreen(),
    ),
    );

    } catch (e) {

    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(e.toString())),
    );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: const Text("User Information")),

    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(20),

    child: Column(
    children: [

    TextField(
    controller: nameController,
    decoration: const InputDecoration(
    labelText: "Name",
    border: OutlineInputBorder(),
    ),
    ),

    const SizedBox(height: 20),

    TextField(
    controller: emailController,
    decoration: const InputDecoration(
    labelText: "Email",
    border: OutlineInputBorder(),
    ),
    ),

    const SizedBox(height: 20),

    TextField(
    controller: passwordController,
    obscureText: true,
    decoration: const InputDecoration(
    labelText: "Create Password",
    border: OutlineInputBorder(),
    ),
    ),

    const SizedBox(height: 20),

    TextField(
    controller: confirmPasswordController,
    obscureText: true,
    decoration: const InputDecoration(
    labelText: "Confirm Password",
    border: OutlineInputBorder(),
    ),
    ),

    const SizedBox(height: 30),

    SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton(
    onPressed: saveUser,
    child: const Text("Continue"),
    ),
    ),

    ],
    ),
    ),
    ),
    );
  }
}
