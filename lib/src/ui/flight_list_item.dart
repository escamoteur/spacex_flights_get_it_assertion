import 'package:flutter/material.dart';
import 'package:spacex_flights/src/ui/DateTimeTextWidget.dart';
import '../models/flight.dart';
import 'flight_detail.dart';

class FlightListItem extends StatefulWidget {
  final Flight flight;

  FlightListItem(this.flight);

  @override
  _FlightListItemState createState() => _FlightListItemState();
}

class _FlightListItemState extends State<FlightListItem> {
  Widget titleColumn() {
    return Expanded(
      flex: 2,
      child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.flight.missionName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(widget.flight.flightNumber.toString())
        ],
      ),
    );
  }

  Widget launchSiteAndDate() {
    return Expanded(
      flex: 1,
      child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            widget.flight.launchSite.siteName,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          DateTimeTextWidget(
              dateTime: widget.flight.launchDateUtc,
              style: TextStyle(
                  color: widget.flight.upcoming
                      ? Colors.orange[200]
                      : Colors.green[200])),
        ],
      ),
    );
  }

  Widget rocketColumn() {
    return Expanded(
      flex: 2,
      child: Column(
        // align the text to the left instead of centered
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.flight.rocket.rocketName, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [titleColumn(), launchSiteAndDate()],
                  ),
                  Row(
                    children: [rocketColumn()],
                  )
                ],
              ),
            ),
            onTap: () => openDetailPage()));
  }

  openDetailPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return FlightDetail();
          },
          settings: RouteSettings(
            arguments: widget.flight,
          )),
    );
  }
}
