import 'package:flutter/material.dart';
import 'package:iaems_app/check_user.dart';
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
      backgroundColor: const Color(0xFF5D7B7D),
      body: SingleChildScrollView(
        child: Padding(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 260,
                    height: 60,
                    child: SwipeableButtonView(
                      buttonText: "  SLIDE TO LOGIN",
                      buttonWidget: const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,),
                      activeColor: Colors.blueGrey.shade600,
                      isFinished: isswiped,
                      onWaitingProcess: () {
                        Future.delayed(const Duration(milliseconds: 500), (){
                          setState(() {
                            isswiped = true;
                          });
                        });
                      },
                      onFinish: () async{
                        await Navigator.push(context, 
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const CheckUser(),
                        ));
                        setState(() {
                          isswiped = false;
                        });
                      },
                      ),
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}