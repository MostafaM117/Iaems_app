import 'package:college_app/providers/course_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';

class BusinessCoursesScreen extends StatefulWidget {
  const BusinessCoursesScreen({super.key});

  @override
  State<BusinessCoursesScreen> createState() => _BusinessCoursesScreenState();
}

class _BusinessCoursesScreenState extends State<BusinessCoursesScreen> {
  final List<Course> courses = [
    Course(
      id: '1',
      name: 'Business Administration',
      description:
          'Learn fundamental principles of business management and administration.',
    ),
    Course(
      id: '2',
      name: 'Financial Accounting',
      description: 'Master the basics of accounting and financial reporting.',
    ),
    Course(
      id: '3',
      name: 'Marketing Management',
      description: 'Study modern marketing strategies and consumer behavior.',
    ),
    Course(
      id: '4',
      name: 'Business Economics',
      description: 'Understand economic principles in business context.',
    ),
    Course(
      id: '5',
      name: 'Business Law',
      description: 'Learn legal aspects of business operations and contracts.',
    ),
    Course(
      id: '6',
      name: 'Human Resource Management',
      description: 'Study personnel management and organizational behavior.',
    ),
    Course(
      id: '7',
      name: 'International Business',
      description: 'Explore global business operations and strategies.',
    ),
    Course(
      id: '8',
      name: 'Entrepreneurship',
      description: 'Learn to start and manage your own business venture.',
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
