import 'package:flutter/material.dart';
import 'package:mokuteki_playgrounds/observable_lessons/courses_observable.dart';
import 'package:mokuteki_playgrounds/widgets/drawer.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Mokuteki.io Playgrounds'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Consumer<CoursesO>(
          builder: (context, o, child) =>
              Text('there are ${o.courses.length} courses available'),
        ),
      ),
    );
  }
}
