import 'package:flutter/material.dart';
import 'package:leja/views/pages/events/float/event_editing.dart';
import 'package:leja/views/widgets/calendar_widget.dart';

class EventsDashboard extends StatefulWidget {
  const EventsDashboard({Key? key}) : super(key: key);

  @override
  _EventsDashboardState createState() => _EventsDashboardState();
}

class _EventsDashboardState extends State<EventsDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EventEditingPage()));
        },
        child: const Icon(Icons.add),
      ),
      body: const CalendarWidget(),
    ));
  }
}
