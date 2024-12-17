import 'package:flutter/material.dart';
import 'package:iaems_app/login_page.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5D7B7D),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF344772)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0xFF5D7B7D),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFF344772),
                    width: 4,
                  ),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF344772),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Guest',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              _lockedListTile(context, 'Full Name'),
              _lockedListTile(context, 'Phone Number'),
              _lockedListTile(context, 'ID'),
              _lockedListTile(context, 'College'),
              _lockedListTile(context, 'Major'),
              _lockedListTile(context, 'Minor'),
              _lockedListTile(context, 'GPA'),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF344772),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _lockedListTile(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Icon(
              Icons.lock,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sign in to access this feature'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}