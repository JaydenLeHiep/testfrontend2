// flight_popup.dart

import 'package:flutter/material.dart';
import '../models/airline_flight.dart'; // Adjust the import path if needed

class FlightPopup extends StatelessWidget {
  final AirlineFlight flight;

  const FlightPopup({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hex: ${flight.hex ?? 'N/A'}'),
            Text('Reg Number: ${flight.regNumber ?? 'N/A'}'),
            Text('Flag: ${flight.flag ?? 'N/A'}'),
            Text('Squawk: ${flight.squawk ?? 'N/A'}'),
            Text('Flight ICAO: ${flight.flightIcao ?? 'N/A'}'),
            Text('Flight IATA: ${flight.flightIata ?? 'N/A'}'),
            Text('Departure ICAO: ${flight.depIcao ?? 'N/A'}'),
            Text('Departure IATA: ${flight.depIata ?? 'N/A'}'),
            Text('Arrival ICAO: ${flight.arrIcao ?? 'N/A'}'),
            Text('Arrival IATA: ${flight.arrIata ?? 'N/A'}'),
            Text('Airline ICAO: ${flight.airlineIcao ?? 'N/A'}'),
            Text('Airline IATA: ${flight.airlineIata ?? 'N/A'}'),
            Text('Aircraft ICAO: ${flight.aircraftIcao ?? 'N/A'}'),
            Text('Status: ${flight.status ?? 'N/A'}'),
            Text('Lat: ${flight.lat.toString()}'),
            Text('Lng: ${flight.lng.toString()}'),
            Text('Vertical Speed: ${flight.vSpeed.toString()}'),
            Text('Altitude: ${flight.alt.toString()}'),
            Text('Direction: ${flight.dir.toString()}'),
            Text('Speed: ${flight.speed.toString()}'),
            Text('Updated: ${flight.updated.toString()}'),
          ],
        ),
      ),
    );
  }
}
