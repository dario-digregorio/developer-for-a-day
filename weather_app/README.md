# Developer for a Day Frontend (09.12.2022)

## Welcome to Developer for a day!

### Introduction & Setup

You will implement features for an [Flutter](https://flutter.dev//) Cross Plattform Application. The App shows weather stations that are fetched from the weather backend. The Project comes with all the tools and UI elements that you need. Flutter are written in Dart. Take a look at the useful links section for reading material.

#### What you need to start
1. Follow the get started guide on the [Flutter Get Startet](https://flutter.dev/docs/get-started/install)
2. You need to have a device or emulator to run the app
     - To run the app on an Android device you need to enable developer mode on your device, enable USB debugging and install Android Studio
     - To run the app on an iOS device you need a Mac with Xcode installed 
3. Install the initial flutter app on that device (follow the guide)
4. Make sure you use the right IP address in `weather_service.dart` to communicate with the backend from the device
5. That's it, you are ready to go!

#### Useful Links

- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Samples with Code](https://flutter.github.io/samples/#)
- [Dart Cheat Sheet](https://dart.dev/codelabs/dart-cheatsheet)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

___
## Implementation

### Task Beginner: Implement APIs from the backend and modal

This task is divided in two parts. The first part is to implement the APIs to delete one or all Stations. The second part is to use the APIs in the UI by implementing for each station a delete button to remove one or all stations.


#### CRUD [What is CRUD?](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)

There are already methods to add, fetch and fetch all stations in `weather_service.dart`. Use them as a guide to implement the delete methods with the `TODO`.

#### Delete Buttons

For every station we need a button to delete that station. For that we need to use the `deleteStation` method in `weather_station.dart` and then call `fetchStations` to update the list of stations.
Then we need another button in the app bar which deletes all stations. For that we need to use the `deleteAllStations` method in `weather_station.dart` and then call `fetchStations` to update the list of stations.

### Task Advanced: Implement Weather Map API

The Backend has an API which returns all weather stations and their data (/api/map). Right now we fetch all stations use the provided IDs to fetch the weather data of each station. By using the weather map call we can combine all the API calls to only one. 
These are the steps:
* Implement a `fetchWeatherMap` method in `weather_service.dart`
* Use the `fetchWeatherMap` method in `weather_page.dart` to fetch the weather data. There is already a TODO at the top which initializes the `weatherMap` variable.
* Refactor the widgets to allow to pass the weather map and display the data
* (Optional) pass the `temperatureUnit` query parameter to specify the temperature unit and implement a toggle in the Appbar to switch between Celsius and Fahrenheit

___


