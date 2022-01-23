import 'package:brb_biliard/config/event.dart';
import 'package:brb_biliard/screen/eventprovider.dart';
import 'package:brb_biliard/screen/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          // actions: buildViewingActions(context, event),
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
              event.description,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      );

//   Widget buildDateTime(Event event) {
//     return Column(
//       children: [buildDate(event.isAllDay ? 'Minden nap' : 'TÓL', event.from)
//       if(!event.isAllDay) buildDate('IG', event.to),
//       ],
//     );
//   }

//   List<Widget> buildViewingActions(BuildContext context, Event event){
//     IconButton(
//       icon: Icon(Icons.edit),
//       onPressed: () => Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => EventViewingPage(event: event)
//           ),
//       ),
//     );
//     IconButton(
//       icon: Icon(Icons.delete),
//       onPressed: (){
//         final provider = Provider.of<EventProvider>(context, listen: true);

//         provider.deleteEvent(event);
//       });

// }
}
