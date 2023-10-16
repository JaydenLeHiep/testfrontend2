import 'dart:async';
import 'package:flights_frontend/widgets/flight_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'services/flight_service.dart';
import 'models/airline_flight.dart';
import 'services/airport_service.dart';
import 'models/airport.dart';
import 'dart:math' as math;

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyMap(),
    );
  }
}

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late FlightService flightService;
  List<AirlineFlight> flights = [];
  late AirportService airportService;
  List<Airport> airports = [];
  late Timer timer;

  @override
  void initState() {
    super.initState();

    flightService = FlightService(baseUrl: 'https://localhost:7249');
    airportService = AirportService();

    airportService.loadAirports().then((_) {
      setState(() {
        airports = airportService.airports;
      });
    });

    fetchData();
    timer = Timer.periodic(const Duration(minutes: 2), (timer) => fetchData());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> fetchData() async {
    try {
      List<AirlineFlight> newFlights = await flightService.fetchFlights();
      setState(() {
        flights = newFlights;
      });
    } catch (e) {
      print("Error fetching flights: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (flights.isEmpty) {
      return const CircularProgressIndicator();
    } else {
      return Center(
        child: flutterMapMethod(context),
      );
    }
  }

  FlutterMap flutterMapMethod(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        // ignore: deprecated_member_use
        center: LatLng(47.5162, 14.5501),
        // ignore: deprecated_member_use
        zoom: 6.2,
        // ignore: deprecated_member_use
        interactiveFlags: InteractiveFlag.pinchZoom |
            InteractiveFlag.pinchMove |
            InteractiveFlag.drag,
      ),
      children: [
        tileLayerMethod(),
        markerLayerMethod(context),
        PolylineLayer(options: polylineLayerMethod()),
      ],
    );
  }

  TileLayer tileLayerMethod() {
    return TileLayer(
      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.app',
    );
  }

  MarkerLayer markerLayerMethod(BuildContext context) {
    return MarkerLayer(
      markers: flights.map((flight) {
        return Marker(
          point: LatLng(flight.lat!, flight.lng!),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: FlightTooltip(flight: flight),
                  );
                },
              );
            },
            child: Transform.rotate(
              angle: flight.dir * (math.pi / 180),
              child: SvgPicture.asset(
                'assets/flight.svg',
                width: 5,
                height: 5,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  PolylineLayerOptions polylineLayerMethod() {
    return PolylineLayerOptions(
      polylines: flights
          .map((flight) {
            Airport? departureAirport =
                airportService.getAirportByIata(flight.depIata ?? "");
            Airport? arrivalAirport =
                airportService.getAirportByIata(flight.arrIata ?? "");

            if (departureAirport == null || arrivalAirport == null) {
              return null;
            }

            return Polyline(
              points: [
                LatLng(departureAirport.latitude, departureAirport.longitude),
                LatLng(arrivalAirport.latitude, arrivalAirport.longitude),
              ],
              color: Colors.red,
              strokeWidth: 0.5,
            );
          })
          .where((line) => line != null)
          .cast<Polyline>()
          .toList(),
    );
  }
}

class PolylineLayerOptions {
  final List<Polyline> polylines;

  PolylineLayerOptions({required this.polylines});
}

class PolylineLayer extends StatelessWidget {
  final PolylineLayerOptions options;

  const PolylineLayer({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    final map = MapCamera.of(context);

    return MobileLayerTransformer(
      child: CustomPaint(
        painter: PolylinePainter(options.polylines, map),
        size: Size(map.size.x, map.size.y),
        isComplex: true,
      ),
    );
  }
}
