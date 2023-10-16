import 'dart:convert';
import 'package:flutter/services.dart';
// import 'package:latlong2/latlong.dart';
import 'package:flights_frontend/models/airport.dart';

class AirportService {
  List<Airport> _airports = []; // Initialize here

  Future<void> loadAirports() async {
    String jsonString = await rootBundle.loadString('assets/airports.json');
    List<dynamic> raw = json.decode(jsonString);
    _airports = raw.map((e) => Airport.fromJson(e)).toList();
  }

  Airport? getAirportByIata(String iataCode) {
    try {
      return _airports.firstWhere((a) => a.iataCode == iataCode);
    } catch (e) {
      return null; // Return null if no airport matches the given iataCode
    }
  }

  // Add this getter to provide access to the _airports list
  List<Airport> get airports => _airports;
}
