import 'package:bpsn/weather_forecast/util/Convert_icon.dart';
import 'package:flutter/material.dart';
import '../model/WeatherForecastModel.dart';
import '../util/ForecastUtil.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
  var forecastlist = snapshot.data?.list;
  var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastlist![0].dt * 1000);
  var temperature = (373.0 - forecastlist[0].main!.temp).toStringAsFixed(1);
  var Maxtemperature = (373.0 - forecastlist[0].main!.tempMax).toStringAsFixed(1);
  var Currentweather = forecastlist[0].weather![0]?.description!.toUpperCase();
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
              "${snapshot.data?.city?.name}, ${snapshot.data?.city?.country}",
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
          ),
          Text(
            Util.getFormattedDate(formattedDate),
            style:const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5,),
          getWeatherIcon(weatherDescription: forecastlist[0].weather[0].main, size: 195),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "$temperature °F",
                    style:const TextStyle(
                      fontSize: 34,
                    ),
                ),
                Text(
                    "  $Currentweather",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 12),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.wind_power,size: 50,color: Colors.brown,),
                      const SizedBox(height: 10,),
                      Text("${forecastlist[0].wind!.speed!.toStringAsFixed(1)} km/h"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 455.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Icon(Icons.water_drop,size: 50,color: Colors.blueAccent,),
                     Text(
                       "${forecastlist[0].main!.humidity!.toStringAsFixed(0)} %",
                     ),
                   ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.thermostat_rounded,size: 50,color: Colors.deepOrange,),
                      Text(
                        "$Maxtemperature °F",
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),





        ],
      ),
    ),
  );
  return midView;
}