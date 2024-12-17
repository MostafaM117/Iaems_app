import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GuestDashboard extends StatefulWidget {
  final String guestNumber;
  GuestDashboard({required this.guestNumber});

  @override
  State<GuestDashboard> createState() => _GuestDashboardState();
}

class _GuestDashboardState extends State<GuestDashboard> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GuestDashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            )]
      ),
      body: Center(child: Text('Signed in guest: ${widget.guestNumber}')),
    );
  }
}