// airport.dart
class Airport {
  final String iataCode;
  final double latitude;
  final double longitude;

  Airport({
    required this.iataCode,
    required this.latitude,
    required this.longitude,
  });

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      iataCode: json['iata_code'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
