import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iaems_app/dashboard.dart';
import 'package:iaems_app/guest_dashboard.dart';
import 'package:iaems_app/login_page.dart';

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            User? user = snapshot.data;
            if (user!=null && user.isAnonymous){
              return GuestDashboard(guestNumber : user.uid);
            }
            return Dashboard();
          }
          
          else {
            return LoginPage();
          }
        }
        ),
    );
  }
}