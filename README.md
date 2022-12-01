# Developer for a Day

Code base and supplementary material for the "Developer for a Day" event held at NTT DATA.

## How to get started
1. Create a GitHub Account [here](https://github.com/join)
2. Tell your Constructors your GitHub Username. So he can add you as collaborator to the Repository [here](https://github.com/dario-digregorio/developer-for-a-day)
3. `git clone` the repository to your local machine
4.  (Optional) It may be necessary to create a token or ssh key to access the repository. [Here](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) you can find a guide on how to create a token. [Here](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) you can find a guide on how to create a ssh key.
5. Follow the `Installation Requirements for Backend` section down bellow
6. Follow the Instructions in the `README.md` of the `weather_app` or `weather-ui` folder (you can choose if you want to implement the UI in Flutter or Angular)
7. If you have any questions, ask your Constructors
8. Have fun!

## Installation Requirements for Backend

* [Git](https://git-scm.com/download) or [Git for Windows](https://gitforwindows.org/)

* IDE - recommended are [IntelliJ](https://www.jetbrains.com/idea/download/) or [VS Code](https://code.visualstudio.com/Download/)

* [JDK 11](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)

* [Docker Desktop](https://docs.docker.com/desktop/)

    If you work under Windows, make sure the box "Use the WSL 2 based engine" under Settings > General is checked.

* [Maven](https://maven.apache.org/install.html)

    Follow the instructions to set the environment variables `JAVA_HOME` and `MAVEN_HOME`. Do not forget to also add `%JAVA_HOME%\bin` and `%MAVEN_HOME%\bin` to the PATH environment variable.

* [Postman](https://www.postman.com/downloads/)


## Goal

The attendees of this workshop will gain first experience as cloud-native developers by extending the implementation of three existing microservices.
Both backend microservices `weather-station` and `weather-map` are implemented in Java using the Quarkus framework.
There are two frontends `weather-ui` or `weather_app` which the participants can choose from. The `weather-ui` directory contains a `Angular 13` project and the `weather_app` contains a `Flutter` App.

## Tasks

Take a look at the project [Backlog](https://github.com/users/dario-digregorio/projects/3) to know what tasks you have to implement 

* Backend -> _weather station microservice_

    In the StationResource, implement POST and DELETE REST API endpoints to put a new record into the database, to delete a record by name and to delete all records.

* Frontend

    Integrate the POST and DELETE REST API endpoints from the backend and call them upon user interaction. Implement a delete modal to ask the user to confirm the requested delete operation before it is executed.

* Backend -> _weather map microservice_

    In the WeatherStationApi, complete the implementation of the REST API client. Inject it into the WeatherCollector to construct a WeatherMap with the data obtained from the weather stations.

* Frontend

    Replace the multiple GET REST API calls to the weather station with a single GET REST API call to the weather map.

* Backend -> _weather map microservice_

    In the WeatherMapResource, add temperatureUnit as a request parameter and pass it to the WeatherCollector. In the WeatherCollector, implement methods to convert the temperature attribute of the WeatherData object obtained from the weather station between Celsius and Fahrenheit as requested.

## Supplementary Material

* `developer-for-a-day.pptx` -> the introductory presentation

    In case you are unfamiliar with Scrum, it is also advisable to read the [Scrum Primer](https://scrumprimer.org/scrumprimer20.pdf).

* `Makefile` -> a collection of useful commands to start the backend microservices on localhost in DEV mode or as Docker containers 

* `developer-for-a-day.postman_collection.json` -> a Postman collection of REST API requests to test your implementation

## Retro 
For the Retro we will use [Miro](https://miro.com/app/board/uXjVO552lL4=/?share_link_id=328956951672). The password is `weAREgreat!`
