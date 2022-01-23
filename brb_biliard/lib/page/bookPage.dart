import 'package:brb_biliard/screen/drawer.dart';
import 'package:brb_biliard/screen/eventdatasource.dart';
import 'package:brb_biliard/screen/eventprovider.dart';
import 'package:brb_biliard/widget/taskwidget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:brb_biliard/page/eventEditingPage.dart';
import 'package:provider/provider.dart';

class bookPage extends StatefulWidget {
  @override
  State<bookPage> createState() => _bookPageState();
}

class _bookPageState extends State<bookPage> {
  CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return new Scaffold(
      appBar: AppBar(
        title: Text("BRB biliárd időpont foglalás"),
        backgroundColor: const Color(0xffCE5D34),
      ),
      body: SfCalendar(
        onLongPress: (details) {
          final provider = Provider.of<EventProvider>(context, listen: false);

          provider.setDate(details.date!);
          showModalBottomSheet(
              context: context, builder: (context) => TaskWidget());
        },
        view: CalendarView.month,
        dataSource: EventDataSource(events),
        controller: _calendarController,
        firstDayOfWeek: 1,
        initialDisplayDate: DateTime.now(),
        initialSelectedDate: DateTime.now(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xffCE5D34),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EventEditingPage(),
          ),
        ),
      ),
      drawer: NavDrawer(),
    );
  }
}
