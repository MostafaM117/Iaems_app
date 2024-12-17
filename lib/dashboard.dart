import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iaems_app/colors.dart';
import 'package:iaems_app/notify.dart';
import 'package:iaems_app/timeline.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            )]
      ),
      // body: Center(child: Text("Signed in as:" + user.email!)),
       body: Container(
          padding: const EdgeInsets.only(top: 50.0, bottom: 5.0, right: 10.0, left: 10.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: Column(
                  children: [
                    NotifyDropDown(),
                    SizedBox(height: 20),
                    TimelineDropDown(),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.home, color: Colors.white,),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.library_books, color: Colors.white),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.info_outline_rounded, color: Colors.white),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.account_box_outlined, color: Colors.white),),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}