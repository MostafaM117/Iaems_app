import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}): super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailcontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  Future<void>checkEmailforPasswordReset(String email, BuildContext context) async{
    try{
      final querySnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: email).get();
    
    if(querySnapshot.docs.isNotEmpty){
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent successfully')),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No user found, Please enter a valid email')),
      );
    }
  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to send password reset email, error: $e')),
    );
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password',
        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.black),),
        backgroundColor: Color(0xFF5D7B7D),
      ),
        backgroundColor: Color(0xFF5D7B7D),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("Please enter your email and we will send you a password reset link.",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 30,),
        
              TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.blueGrey.shade200,
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Please enter your email',
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
              SizedBox(height: 30,),
              OutlinedButton(
                    onPressed: (){
                      final email = _emailcontroller.text.trim();
                      if(email.isNotEmpty){
                      checkEmailforPasswordReset(email, context);
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter an email')),
                        );
                      }
                    },style: TextButton.styleFrom(
                    side: const BorderSide(
                      width: 0.2,
                      color: Colors.white,
                    ),
                    disabledBackgroundColor: Colors.grey,
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  ), child: const Text("Reset Password", style: TextStyle(color: Colors.white, fontSize: 20),)
                  ),
            ],
          ),
        ),
      ),
    );
  }
}