import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iaems_app/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signIn() async {
    final String email = _emailcontroller.text.trim();
    final String password = _passwordcontroller.text.trim();
    if(email.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An email address is required')),
      );
      return;
    }
    if(password.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your password')),
      );
      return;
    }
    try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged in successfully'),
      backgroundColor: Colors.green,));
    } on FirebaseAuthException catch (e) {
      
      print('Error code : ${e.code}');
      if (e.code == 'too-many-requests'){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('This device is temporarily blocked due to much failed login attempts, try again later.'),
            backgroundColor: Colors.red,
          ),
        );
      }
      else if (e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found with this email'),
            backgroundColor: Colors.red,
          ),
        );
      }
      else if (e.code == 'invalid-credential'){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect email or Password'),
          ),
        );
      }
      else if (e.code == 'invalid-email'){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a valid email address'),
          ),
        );
      }
    }
  } 

  void signInAnonymously() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Signed in as Guest'),
          backgroundColor: Colors.green,
        ),
      );
      User? user = userCredential.user;
      print('User signed in anonymously: ${user?.uid}');
    } on FirebaseAuthException catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'Failed to sign in as Guest'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error code : ${e.code}');
    }
  }
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child:Image.asset(
              'assets/login.png',
              fit: BoxFit.cover,
            )
            ),
            SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Container(
            height: 720,
            child: Column(
            children: [
              SizedBox(
                height: 220,
              ),
              Text("Log in", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),),
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    prefixIcon: Icon(Icons.person, color: Colors.white,),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _passwordcontroller,
                  cursorColor: Colors.white,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    prefixIcon: Icon(Icons.lock, color: Colors.white,),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage(),
                          ));
                    },
                    child: const Text("Forgot password ?", 
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
                  SizedBox(width: 10,),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      signIn();
                    },style: TextButton.styleFrom(
                    side: const BorderSide(
                      width: 0.2,
                      color: Colors.white,
                    ),
                    disabledBackgroundColor: Colors.white,
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  ), child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),)
                  ),
                  SizedBox(width: 10,),
                  Text("or", style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(width: 10,),
                  OutlinedButton(
                    onPressed: (){
                      signInAnonymously();
                    },style: TextButton.styleFrom(
                    side: const BorderSide(
                      width: 0.2,
                      color: Colors.white,
                    ),
                    disabledBackgroundColor: Colors.white,
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  ), child: const Text("I'm a Guest", style: TextStyle(color: Colors.white, fontSize: 20),)
                  ),
                ],
              )
            ],
          ),
          )
        ),
      ),
        ],
      )
    );
  }
}