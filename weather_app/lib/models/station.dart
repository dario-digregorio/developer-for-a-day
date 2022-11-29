import 'dart:core';

class Station {
  String? stationName;

  Station({this.stationName});

  factory Station.fromJson(String stationName) {
    stationName = stationName;
    return Station(stationName: stationName);
  }
}

class WeatherStation {
  String? stationName;
  int? temperature;
  String? temperatureUnit;
  String? clouds;

  WeatherStation(
      {this.stationName, this.temperature, this.temperatureUnit, this.clouds});

  WeatherStation.fromJson(Map<String, dynamic> json) {
    stationName = json['stationName'];
    temperature = json['temperature'];
    temperatureUnit = json['temperatureUnit'];
    clouds = json['clouds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stationName'] = stationName;
    data['temperature'] = temperature;
    data['temperatureUnit'] = temperatureUnit;
    data['clouds'] = clouds;
    return data;
  }
}

class WeatherMap {
  List<WeatherStation>? weatherStations;

  WeatherMap({this.weatherStations});

  WeatherMap.fromJson(Map<String, dynamic> json) {
    if (json['weatherStations'] != null) {
      weatherStations = <WeatherStation>[];
      json['weatherStations'].forEach((v) {
        weatherStations!.add(WeatherStation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weatherStations != null) {
      data['weatherStations'] =
          weatherStations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
