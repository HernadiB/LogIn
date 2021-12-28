// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class IdopontPage extends StatefulWidget {
  @override
  _IdopontPage createState() => _IdopontPage();
}

class _IdopontPage extends State<IdopontPage> {
  
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  // List<Event> _getEventsForDay(DateTime day) {
  //   return events[day] ?? [];
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
        // padding: EdgeInsets.all(8),
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call setState() when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            // eventLoader: (day) {
            //   return _getEventsForDay(day);
            // },
            locale: 'hu_HU',
          ),
        ],
      ),
    );
  }
}
