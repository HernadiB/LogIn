import 'package:brb_biliard/config/event.dart';
import 'package:brb_biliard/screen/eventprovider.dart';
import 'package:brb_biliard/screen/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          actions: buildViewingActions(context, event),
          backgroundColor: const Color(0xffCE5D34),
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            // buildDateTime(event),
            SizedBox(height: 32),
            Text(
              event.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              Utils.toDate(event.from),
            ),
            const SizedBox(height: 24),
            Text(
              Utils.toTime(event.from),
            ),
          ],
        ),
      );

  List<Widget> buildViewingActions(BuildContext context, Event event) => [
        IconButton(
          onPressed: () {
            final provider = Provider.of<EventProvider>(context, listen: false);
            provider.deleteEvent(event);
          },
          icon: Icon(Icons.delete),
        ),
      ];
}
