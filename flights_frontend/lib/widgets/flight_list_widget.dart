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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/austrian1.png',
            width: 400,
            height: 200,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: flights.length,
            itemBuilder: (context, index) {
              AirlineFlight flight = flights[index];
              return ListTile(
                title: Text('Flight IATA: ${flight.flightIata ?? 'N/A'}'),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
