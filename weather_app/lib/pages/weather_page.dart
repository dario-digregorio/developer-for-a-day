import 'package:flutter/material.dart';
import 'package:weather_app/models/station.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<WeatherPage> createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage> {
  Future<List<Station>> weatherData = WeatherService().fetchStations();
  // TODO Advanced Exercise: Add a Future<List<WeatherStation>> weatherData
  // Future<WeatherMap> weatherMap = WeatherService().fetchWeatherMap();
  final _textController = TextEditingController();

  Future<void> refreshWeatherData() async {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      weatherData = WeatherService().fetchStations();
      _textController.clear();
    });
  }

  void _addStationDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Add Station'),
              content: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Station Name',
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('ADD'),
                  onPressed: () {
                    WeatherService()
                        .addStation(_textController.text)
                        .then((value) => refreshWeatherData());
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // TODO add delete all button
      ),
      body: RefreshIndicator(
        onRefresh: refreshWeatherData,
        child: FutureBuilder(
            future: weatherData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          final station = snapshot.data![index].stationName!;
                          return WeatherTile(station);
                        })
                    : const Center(child: Text('No Stations'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStationDialog,
        tooltip: 'add station',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WeatherTile extends StatelessWidget {
  final String stationName;
  const WeatherTile(this.stationName, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: WeatherService().fetchStationWeather(stationName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final condition = snapshot.data!.clouds!;
            final temperature = snapshot.data!.temperature!.toString();
            final temperatureUnit = snapshot.data!.temperatureUnit!;
            return ListTile(
              title: Text(stationName),
              subtitle: Text(condition.replaceAll('_', ' ').toLowerCase()),
              leading: Image.asset(
                'assets/${condition.toLowerCase()}.png',
              ),
              onTap: () {},
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (temperature +
                        (temperatureUnit == 'FAHRENHEIT' ? ' °F' : ' °C')),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // TODO add delete button
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
