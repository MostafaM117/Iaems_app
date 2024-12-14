import 'package:college_app/providers/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';

class MassCommScreen extends StatefulWidget {
  const MassCommScreen({super.key});

  @override
  State<MassCommScreen> createState() => _MassCommScreenState();
}

class _MassCommScreenState extends State<MassCommScreen> {
  final List<Course> courses = [
    Course(
      id: '1',
      name: 'Media Writing',
      description: 'Learn effective writing for various media platforms.',
    ),
    Course(
      id: '2',
      name: 'Digital Journalism',
      description:
          'Master modern journalism techniques and digital storytelling.',
    ),
    Course(
      id: '3',
      name: 'Public Relations',
      description: 'Study PR strategies and communication management.',
    ),
    Course(
      id: '4',
      name: 'Broadcasting',
      description: 'Learn radio and television production techniques.',
    ),
    Course(
      id: '5',
      name: 'Social Media Management',
      description: 'Master social media strategy and content creation.',
    ),
    Course(
      id: '6',
      name: 'Media Ethics',
      description: 'Study ethical principles in mass communication.',
    ),
    Course(
      id: '7',
      name: 'Visual Communication',
      description: 'Learn design principles for media content.',
    ),
    Course(
      id: '8',
      name: 'Media Production',
      description: 'Create compelling multimedia content.',
    ),
  ];

  void _addCourse(BuildContext context, Course course) {
    final courseProvider = Provider.of<CourseProvider>(context, listen: false);
    if (!courseProvider.isCourseEnrolled('Business', course)) {
      courseProvider.addCourse('Business', course);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${course.name} added to your time table'),
          backgroundColor: const Color(0xFF344772),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D7B7D),
      appBar: AppBar(
        title: const Text(
          'Business Courses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF344772),
        elevation: 0,
      ),
      body: Consumer<CourseProvider>(
        builder: (context, courseProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                final isEnrolled =
                    courseProvider.isCourseEnrolled('Business', course);

                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF344772),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.school,
                            size: 40,
                            color: Color(0xFF72F1C8),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                course.description,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: isEnrolled
                                      ? null
                                      : () => _addCourse(context, course),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF72F1C8),
                                    foregroundColor: const Color(0xFF344772),
                                    disabledBackgroundColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    isEnrolled ? 'Added' : 'Add Course',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
