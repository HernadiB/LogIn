import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:brb_biliard/screen/drawer.dart';

class bookPage extends StatefulWidget {
  @override
  State<bookPage> createState() => _bookPageState();
}

class _bookPageState extends State<bookPage> {
  CalendarController _calendarController = CalendarController();

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> dencodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("BRB biliárd időpont foglalás"),
          backgroundColor: const Color(0xffCE5D34),
        ),
        drawer: NavDrawer(),
        body: SfCalendar(
          view: CalendarView.week,
          controller: _calendarController,
          firstDayOfWeek: 1,
          initialDisplayDate: DateTime.now(),
          initialSelectedDate: DateTime.now(),
          dataSource: BookDataSource(
            getAppointments(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ));
  }
}

List<Appointment> getAppointments() {
  List<Appointment> appoint = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 8, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  appoint.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: 'BRB biliárd',
    color: Colors.blue,
    // isAllDay: true,
    // recurrenceRule: 'FREQ=DAILY;COUNT=10'
  ));

  return appoint;
}

class BookDataSource extends CalendarDataSource {
  BookDataSource(List<Appointment> source) {
    appointments = source;
  }
}
