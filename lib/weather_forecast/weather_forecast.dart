import 'package:bpsn/weather_forecast/ui/bottom_view.dart';
import 'package:bpsn/weather_forecast/ui/mid_View.dart';
import 'package:flutter/material.dart';
import 'model/WeatherForecastModel.dart';
import 'network/Network.dart';

class weather_forecast extends StatefulWidget {
  const weather_forecast({Key? key}) : super(key: key);

  @override
  State<weather_forecast> createState() => _weather_forecastState();
}

class _weather_forecastState extends State<weather_forecast> {
  late String _cityName = "Mumbai";
  late Future<WeatherForecastModel> forecastObject;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Hello");
    forecastObject = getforeCastObject(cityName: _cityName);

    // forecastObject.then((weather){
    //     print(weather.city?.country);
    //     print(weather.list![0]?.weather![0]?.main);
    //   }
    // );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),

          Container(
            child: FutureBuilder(
              future: forecastObject,
              builder: (context,AsyncSnapshot<WeatherForecastModel> snapshot){
                //*****************Main body when the Json payload is successfully loaded.
                if(snapshot.hasData)
                {
                  return Column(
                    children: <Widget>[
                      midView(snapshot), //*************MidView is a widget made in ui folder for middle view of the weather app.
                      bottomView(snapshot,context),
                    ],
                  );
                }
                else
                {
                  return Container(
                    child:const Column(
                      children: [
                        Text(
                            "This Place is not in the database",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                        ),
                        CircularProgressIndicator(),
                      ],
                    ),

                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }




  // *****************************************************Functions that are used in the UI****************************************
  Widget textFieldView() {
    return Container(
      padding:const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon:const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:const EdgeInsets.all(8),
        ),
        onSubmitted: (value){
          setState(() {
            _cityName = value;
            forecastObject = getforeCastObject( cityName: _cityName);
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getforeCastObject({required String cityName}) {
    print("fd");
    return Network().getWeatherForecast(cityName: _cityName);
  }

}
