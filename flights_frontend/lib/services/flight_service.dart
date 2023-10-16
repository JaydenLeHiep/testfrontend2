import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/airline_flight.dart';

class FlightService {
  final String baseUrl;

  FlightService({required this.baseUrl});

  Future<List<AirlineFlight>> fetchFlights() async {
    final response = await http.get(Uri.parse('$baseUrl/flights'));
    if (response.statusCode == 200) {
      List<dynamic> responseBody = json.decode(response.body);
      return responseBody
          .map((flight) => AirlineFlight.fromJson(flight))
          .toList();
    } else {
      throw Exception('Failed to load flights');
    }
  }
}
