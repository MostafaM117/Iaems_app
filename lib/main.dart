import 'package:flutter/material.dart';
import 'package:iaems_app/login_page.dart';
import 'package:iaems_app/profile_page.dart';
import 'package:iaems_app/guest_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GuestPage(),
    );
  }
}