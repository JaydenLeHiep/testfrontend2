import 'package:flutter/material.dart';
import '../models/airline_flight.dart'; // Ensure the import path is correct

class FlightListWidget extends StatelessWidget {
  final List<AirlineFlight> flights;

  const FlightListWidget({required this.flights, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: flights.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _flightListView(),
    );
  }

  Widget _flightListView() {
    return ListView.builder(
      itemCount: flights.length,
      itemBuilder: (context, index) {
        AirlineFlight flight = flights[index];
        return ListTile(
          title: Text('Flight IATA: ${flight.flightIata ?? 'N/A'}'),
          subtitle: Text('Airline ICAO: ${flight.airlineIcao ?? 'N/A'}'),
          onTap: () {
            // Functionality for when a flight is tapped can be added here
          },
        );
      },
    );
  }
}
