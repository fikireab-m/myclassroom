class Course {
  Course({
    required this.code,
    required this.title,
  });
  String code;
  String title;
  String ratted = "0";
  int progress = 0;
  bool completed = false;
  bool activeNow = false;
}
