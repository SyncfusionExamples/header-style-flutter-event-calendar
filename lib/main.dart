import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(HeaderStyleViewChanged());

class HeaderStyleViewChanged extends StatefulWidget {
  @override
  HeaderStyle createState() => HeaderStyle();
}

class HeaderStyle extends State<HeaderStyleViewChanged> {
  CalendarHeaderStyle _headerStyle;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: SfCalendar(
              view: CalendarView.month,
              onViewChanged: viewChanged,
              headerStyle: _headerStyle,
            ),
          ),

          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  void viewChanged(ViewChangedDetails viewChangedDetails) {
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      var midDate = viewChangedDetails
          .visibleDates[viewChangedDetails.visibleDates.length ~/ 2];
      setState(() {
      if(midDate.month %2==0)
        {
          _headerStyle = CalendarHeaderStyle(
              textAlign: TextAlign.center,
              backgroundColor: Colors.lightGreen,
              textStyle: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 5,
                  color: Colors.red,
                  fontWeight: FontWeight.w500));
        } else if (midDate.month %2 != 0) {
          _headerStyle = CalendarHeaderStyle(
              textAlign: TextAlign.center,
              backgroundColor: Colors.purple,
              textStyle: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 5,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500));
        }
      });
    });
  }
}
