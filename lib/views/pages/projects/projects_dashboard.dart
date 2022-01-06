import 'package:flutter/material.dart';

class ProjectsDashboard extends StatefulWidget {
  const ProjectsDashboard({Key? key}) : super(key: key);

  @override
  _ProjectsDashboardState createState() => _ProjectsDashboardState();
}

class _ProjectsDashboardState extends State<ProjectsDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: ListView(
        children: [],
      ),
    ));
  }
}
