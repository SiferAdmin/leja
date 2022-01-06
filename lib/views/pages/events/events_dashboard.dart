import 'package:flutter/material.dart';
import 'package:leja/views/pages/events/event_editing.dart';
import 'package:leja/views/widgets/calendar_widget.dart';

class EventDashboard extends StatefulWidget {
  const EventDashboard({Key? key}) : super(key: key);

  @override
  _EventDashboardState createState() => _EventDashboardState();
}

class _EventDashboardState extends State<EventDashboard> {
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
