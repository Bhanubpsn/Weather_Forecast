import 'package:bpsn/weather_forecast/util/Convert_icon.dart';
import 'package:bpsn/weather_forecast/util/ForecastUtil.dart';
import 'package:flutter/material.dart';
import '../model/WeatherForecastModel.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot,int index){
  var forecastList = snapshot.data?.list;
  var time = Util.getFormattedTime(DateTime.fromMillisecondsSinceEpoch(forecastList![index]!.dt * 1000));

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              time,
              style:const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 33,
              backgroundColor: Colors.white,
              child: getWeatherIcon(weatherDescription: forecastList[index].weather[0].main,size: 45),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            "${forecastList[index].main.tempMin!.toStringAsFixed(1)} °F",
                        ),
                      ),
                      const SizedBox(width: 8,),
                      const Icon(Icons.arrow_circle_down_sharp,color: Colors.white,size: 17,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "${forecastList[index].main.tempMax!.toStringAsFixed(1)} °F",
                        ),
                      ),
                      const SizedBox(width: 8,),
                      const Icon(Icons.arrow_circle_up_sharp,color: Colors.white,size: 17,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "${forecastList[index].main.humidity!.toStringAsFixed(1)} %",
                        ),
                      ),
                      const SizedBox(width: 18,),
                      const Icon(Icons.water_drop,color: Colors.white,size: 17,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "${forecastList[index].wind!.speed!.toStringAsFixed(1)} km/h",
                        ),
                      ),
                      const SizedBox(width: 8,),
                      const Icon(Icons.wind_power,color: Colors.white,size: 17,),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

    ],
  );

}