class AirlineFlight {
  final String? hex,
      regNumber,
      flag,
      squawk,
      flightNumber,
      flightIcao,
      flightIata,
      depIcao,
      depIata,
      arrIcao,
      arrIata,
      airlineIcao,
      airlineIata,
      aircraftIcao,
      status;
  final double? lat, lng, vSpeed;
  final int alt, dir, speed;
  final int updated;

  AirlineFlight({
    this.hex,
    this.regNumber,
    this.flag,
    this.squawk,
    this.flightNumber,
    this.flightIcao,
    this.flightIata,
    this.depIcao,
    this.depIata,
    this.arrIcao,
    this.arrIata,
    this.airlineIcao,
    this.airlineIata,
    this.aircraftIcao,
    this.status,
    required this.lat,
    required this.lng,
    required this.vSpeed,
    required this.alt,
    required this.dir,
    required this.speed,
    required this.updated,
  });

  factory AirlineFlight.fromJson(Map<String, dynamic> json) {
    return AirlineFlight(
      hex: json['hex'] as String?,
      regNumber: json['regNumber'] as String?, // Updated key
      flag: json['flag'] as String?,
      squawk: json['squawk'] as String?,
      flightNumber: json['flightNumber'] as String?, // Updated key
      flightIcao: json['flightIcao'] as String?, // Updated key
      flightIata: json['flightIata'] as String?, // Updated key
      depIcao: json['depIcao'] as String?, // Updated key
      depIata: json['depIata'] as String?, // Updated key
      arrIcao: json['arrIcao'] as String?, // Updated key
      arrIata: json['arrIata'] as String?, // Updated key
      airlineIcao: json['airlineIcao'] as String?, // Updated key
      airlineIata: json['airlineIata'] as String?, // Updated key
      aircraftIcao: json['aircraftIcao'] as String?, // Updated key
      status: json['status'] as String?,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
      vSpeed: json['vSpeed'] as double?, // Updated key
      alt: json['alt'] as int,
      dir: json['dir'] as int,
      speed: json['speed'] as int,
      updated: json['updated'] as int,
    );
  }
}
