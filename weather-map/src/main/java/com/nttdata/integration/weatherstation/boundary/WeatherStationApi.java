package com.nttdata.integration.weatherstation.boundary;

import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import com.nttdata.integration.weatherstation.control.WeatherStationApiExceptionMapper;
import org.eclipse.microprofile.rest.client.annotation.RegisterProvider;
import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

@Path("/api")
@ApplicationScoped
@RegisterRestClient(configKey = "weather-station.client-api")
@RegisterProvider(WeatherStationApiExceptionMapper.class)
@Produces("application/json")
public interface WeatherStationApi {

  // TODO: provide method signatures for the relevant REST endpoints of the weather station microservice

}
