import 'package:flutter/material.dart';

Widget getWeatherIcon({required String weatherDescription,required double size}){

  switch(weatherDescription){
    case "clear":
        {return Icon(Icons.sunny,color: Colors.yellow,size: size);}
        break;

    case "Clouds":
      {return Icon(Icons.cloud_sharp,color: Colors.blueAccent,size: size);}
      break;

    case "Rain":
      {return Icon(Icons.cloudy_snowing,color: Colors.grey,size: size,);}
      break;

    case "Snow":
      {return Icon(Icons.severe_cold,color: Colors.lightBlueAccent,size: size,);}
      break;

    default:
      {return Icon(Icons.sunny,color: Colors.yellow,size: size,);}
      break;
  }
}