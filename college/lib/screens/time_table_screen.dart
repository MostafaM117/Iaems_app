import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../models/course.dart';

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D7B7D),
      appBar: AppBar(
        title: const Text(
          'Time Table',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF344772),
        elevation: 0,
      ),
      body: Consumer<CourseProvider>(
        builder: (context, courseProvider, child) {
          final enrolledCourses = courseProvider.enrolledCourses;
          
          if (enrolledCourses.values.every((courses) => courses.isEmpty)) {
            return const Center(
              child: Text(
                'No courses enrolled yet.\nGo to departments to add courses.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var entry in enrolledCourses.entries)
                  if (entry.value.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      entry.key,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: entry.value.length,
                        itemBuilder: (context, index) {
                          final course = entry.value[index];
                          return _buildCourseItem(context, course, entry.key, courseProvider);
                        },
                      ),
                    ),
                  ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseItem(
    BuildContext context,
    Course course,
    String department,
    CourseProvider courseProvider,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF344772),
            shape: BoxShape.circle,
          ),
          child: Icon(
            department == 'Engineering'
                ? Icons.engineering
                : department == 'Business'
                    ? Icons.business
                    : Icons.campaign,
            color: const Color(0xFF72F1C8),
          ),
        ),
        title: Text(
          course.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(course.description),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            courseProvider.removeCourse(department, course);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${course.name} removed from your time table'),
                backgroundColor: const Color(0xFF344772),
                duration: const Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );
  }
}
