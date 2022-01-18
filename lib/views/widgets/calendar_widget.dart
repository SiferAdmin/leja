import 'package:flutter/material.dart';
// import 'package:leja/views/pages/events/event_provider.dart';
// import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      view: CalendarView.month,
      // dataSource:EventDataSource(events),
      initialSelectedDate: DateTime.now(),
    );
  }
}

