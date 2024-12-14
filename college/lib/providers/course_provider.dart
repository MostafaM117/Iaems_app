import 'package:flutter/foundation.dart';
import '../models/course.dart';

class CourseProvider extends ChangeNotifier {
  final Map<String, List<Course>> _enrolledCourses = {
    'Engineering': [],
    'Business': [],
    'Mass Communication': [],
  };

  Map<String, List<Course>> get enrolledCourses => _enrolledCourses;

  void addCourse(String department, Course course) {
    if (!_enrolledCourses[department]!.contains(course)) {
      _enrolledCourses[department]!.add(course);
      notifyListeners();
    }
  }

  void removeCourse(String department, Course course) {
    _enrolledCourses[department]!.remove(course);
    notifyListeners();
  }

  bool isCourseEnrolled(String department, Course course) {
    return _enrolledCourses[department]!.contains(course);
  }

  List<Course> getAllEnrolledCourses() {
    List<Course> allCourses = [];
    _enrolledCourses.values.forEach(allCourses.addAll);
    return allCourses;
  }
}
