import 'package:flutter/material.dart';
import '../models/airline_flight.dart'; // Adjust the import path if needed

class FlightTooltip extends StatelessWidget {
  final AirlineFlight flight;

  const FlightTooltip({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      child: DefaultTextStyle(
        style: const TextStyle(
            fontSize: 14,
            color: Colors.black), // Adjust the style as you see fit
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Reg Number: ${flight.regNumber ?? 'N/A'}'),
            Text('Departure IATA: ${flight.depIata ?? 'N/A'}'),
            Text('Arrival IATA: ${flight.arrIata ?? 'N/A'}'),
            Text('Speed: ${flight.speed.toString()}'),
          ],
        ),
      ),
    );
  }
}
