import 'dart:convert';
import 'package:http/http.dart';
import '../model/WeatherForecastModel.dart';
import '../util/ForecastUtil.dart';

class Network{
  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async {
    var finalURL = "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${Util.appId}";

    final response = await get(Uri.parse(finalURL));
    print("URL: ${Uri.encodeFull(finalURL)}");

    if(response.statusCode == 200)
      {
        print("Success");
        // print(response.body);
        return WeatherForecastModel.fromJson(json.decode(response.body));
      }
    else
      {
        throw Exception("Erorrrrrrrr!!!");
      }
  }
}

