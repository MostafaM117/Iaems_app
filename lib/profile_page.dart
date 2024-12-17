import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:iaems_app/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  String? _fullName;
  String? _phoneNumber;
  String? _id;
  String? _college;
  String? _major;
  String? _minor;
  String? _gpa;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _signOut() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Color(0xFF344772)),
            onPressed: () {
            },
          ),
        ],
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
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF344772),
                      width: 4,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    backgroundColor: Color(0xFF344772),
                    child: _image == null
                        ? Icon(
                            Icons.camera_alt, 
                            size: 40, 
                            color: Colors.white
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                _fullName ?? 'Not set',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              _listTile('Full Name', _fullName ?? 'Not set'),
              _listTile('Phone Number', _phoneNumber ?? 'Not set'),   
              _listTile('ID', _id ?? 'Not set'),
              _listTile('College', _college ?? 'Not set'),
              _listTile('Major', _major ?? 'Not set'),
              _listTile('Minor', _minor ?? 'Not set'),
              _listTile('GPA', _gpa ?? 'Not set'),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF344772),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Sign Out',
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

  Widget _listTile(String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          value,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}