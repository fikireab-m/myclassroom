import 'dart:collection';

import 'package:flutter/foundation.dart';
import '../models/course.dart';
import '../models/user.dart';

class Users with ChangeNotifier {
  List<User> _users = [];
  get getUsers {
    return UnmodifiableListView(_users);
  }

  setProgress(User user, Course course, int progress) {}
}
