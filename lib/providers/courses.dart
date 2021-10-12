import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myclassroom/models/course.dart';

class Courses with ChangeNotifier {
  List<Course> _courses = [
    Course(
      title: "C++ Programmig",
      code: "c01",
    ),
    Course(
      title: "Dart Programming",
      code: "c02",
    ),
    Course(
      title: "Python Programming",
      code: "c03",
    ),
    Course(
      title: "Java Programming",
      code: "c04",
    ),
  ];
  List<Course> get getCourses {
    return UnmodifiableListView(_courses);
  }

  getCourseByName(String name) {
    for (var course in getCourses) {
      if (course.title == name) {
        return course;
      }
    }
  }

  activateCourse(Course course) {
    course.activeNow = !course.activeNow;
    notifyListeners();
  }

  completeCourse(Course course) {
    course.completed = true;
    notifyListeners();
  }

  resetCourseProgress(Course course) {
    course.completed = false;
    course.activeNow = true;
    course.progress = 0;
    notifyListeners();
  }
}
