import 'package:flutter/material.dart';
import 'eng_courses_screen.dart';
import 'business_courses_screen.dart';
import 'masscomm_screen.dart';
import 'time_table_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D7B7D),
      appBar: AppBar(
        title: const Text(
          'Choose Department',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF344772),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDepartmentCard(
              context,
              'Engineering',
              Icons.engineering,
              const EngCoursesScreen(),
            ),
            const SizedBox(height: 16),
            _buildDepartmentCard(
              context,
              'Business',
              Icons.business,
              const BusinessCoursesScreen(),
            ),
            const SizedBox(height: 16),
            _buildDepartmentCard(
              context,
              'Mass Communication',
              Icons.campaign,
              const MassCommScreen(),
            ),
            const SizedBox(height: 32),
            _buildTimeTableButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartmentCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFF344772),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: const Color(0xFF72F1C8),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF344772),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF344772),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeTableButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.calendar_today,
          color: Color(0xFF344772),
        ),
        label: const Text(
          'View Time Table',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF344772),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF72F1C8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TimeTableScreen()),
          );
        },
      ),
    );
  }
}
