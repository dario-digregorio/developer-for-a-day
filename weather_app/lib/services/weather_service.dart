import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/station.dart';

class WeatherService {
  late http.Client httpClient;
  static const localIP = '10.0.2.2'; // for Android Emulator
  static const stationPort = '8200';
  static const endPointUrl = 'http://$localIP:$stationPort/api';

  WeatherService() {
    httpClient = http.Client();
  }

  Future<List<Station>> fetchStations() async {
    final response = await httpClient.get(Uri.parse('$endPointUrl/station'));

    if (response.statusCode <= 300) {
      // If server returns an OK response, parse the JSON
      final List t = json.decode(utf8.decode(response.bodyBytes));
      final List<Station> stations =
          t.map((item) => Station.fromJson(item)).toList();
      log("fetched ${stations.length} Stations");
      return stations;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load stations');
    }
  }

  Future<WeatherStation> fetchStationWeather(String stationName) async {
    final response =
        await httpClient.get(Uri.parse('$endPointUrl/weather/$stationName'));

    if (response.statusCode <= 300) {
      // If server returns an OK response, parse the JSON
      log("fetched weather of $stationName");
      return WeatherStation.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load stations');
    }
  }

  Future<void> addStation(String stationName) async {
    final response =
        await httpClient.post(Uri.parse('$endPointUrl/station/$stationName'));

    if (response.statusCode <= 300) {
      log("Station $stationName added");
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to add station $stationName');
    }
  }

  Future<void> deleteStation(String stationName) async {
    // TODO delete Station API
  }

  Future<void> deleteAllStations() async {
    // TODO delete all Stations API
  }
}
