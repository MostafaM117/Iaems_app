import 'package:flutter/material.dart';
import 'package:iaems_app/check_user.dart';
import 'package:iaems_app/colors.dart';
import 'package:iaems_app/login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

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
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/welcome.png', 
              fit: BoxFit.cover, 
            ),
          ),
          // Content on top of the background
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Container(
                height: 720,
                child:  Column(
                children: [
                  const SizedBox(height: 300),
                  const Padding(padding: EdgeInsets.only(
                    left: 118.0,
                  ),child: Row(
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  ),
                  const Padding(padding: EdgeInsets.only(
                    left: 118.0,
                  ),child: Row(
                    children: [
                      Text(
                        "WANT TO RECONNECT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  ),
                  const SizedBox(height: 180),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 260,
                        height: 60,
                        child: SwipeableButtonView(
                          buttonText: "  SLIDE TO LOGIN",
                          buttonWidget: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.darkBlue,
                          ),
                          activeColor: AppColors.darkBlue,
                          isFinished: isswiped,
                          onWaitingProcess: () {
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {
                                isswiped = true;
                              });
                            });
                          },
                          onFinish: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: const CheckUser(),
                              ),
                            );
                            setState(() {
                              isswiped = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              )
            ),
          ),
        ],
      ),
    );
  }
}