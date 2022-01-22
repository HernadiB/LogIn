import 'package:brb_biliard/screen/eventdatasource.dart';
import 'package:brb_biliard/screen/eventprovider.dart';
import 'package:brb_biliard/widget/taskwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialDisplayDate: DateTime.now(),
      onLongPress: (details) {
        final provider = Provider.of<EventProvider>(context, listen: true);

        provider.setDate(details.date!);
        showModalBottomSheet(
          context: context,
          builder: (context) => TaskWidget(),
        );
      },
    );
  }
}
