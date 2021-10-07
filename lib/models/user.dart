import 'dart:html';

import 'package:myclassroom/models/course.dart';

class User {
  User({
    required this.username,
  });
  String username;
  List<Map<Course, int>> progress = [];
  List<Course> addedCourses = [];
}
