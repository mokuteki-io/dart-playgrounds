import 'package:flutter/material.dart';
import 'package:playground_app/mvos/model/observable/courses_observable.dart';
import 'package:playground_app/router/router.dart';
import 'package:provider/provider.dart';

class CourseListTile extends StatelessWidget {
  final CourseO courseO;

  CourseListTile(this.courseO);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectCourseA>(builder: (context, selectCourseA, child) {
      return ListTile(
        onTap: () {
          selectCourseA.selectCourse(courseO: courseO);
          Navigator.pushNamed(context, RouteName.coursePage);
        },
        title: Text(
          "${courseO.name}",
          style: TextStyle(color: courseO.color),
        ),
        subtitle: Text("${courseO.description}"),
      );
    });
  }
}
