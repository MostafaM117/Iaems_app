import 'package:flutter/material.dart';
import 'package:iaems_app/login_page.dart';
import 'package:swipeable_button_flutter/swipebutton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isswiped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D7B7D),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            const Row(
              children: [
                Text("Welcome", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),),
              ],
            ),
            const Row(
              children: [
                Text("WANT TO RECONNECT", style: TextStyle( fontSize: 16, color: Colors.white),),
              ],
            ),
            const SizedBox(
              height: 180,
            ),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 260,
                    height: 50,
                    child: SwipeButton(
                      swipeButtonColor: const Color(0xFF344772),
                      iconColor: Colors.white,
                      backgroundColor: const Color(0xFF72F1C8),
                      text: "Slide to Login", onSwipeCallback: (){
                        isswiped = true;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      ),
                  ),
                  // ElevatedButton(onPressed: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  // }, child: const Icon(Icons.arrow_forward)),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}