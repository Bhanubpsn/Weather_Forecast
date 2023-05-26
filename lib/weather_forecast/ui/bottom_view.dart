import 'package:flutter/material.dart';
import '../model/WeatherForecastModel.dart';
import 'forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot,BuildContext context){
  var forecastList = snapshot.data?.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
          "3 Hour Weather Forecast".toUpperCase(),
          style:const TextStyle(
            fontSize: 14,
            color: Colors.black38,
          ),
      ),
      Container(
        height: 170,
        padding:const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context,index)=>const SizedBox(width: 8,),
            itemCount: forecastList!.length, 
            itemBuilder: (BuildContext context, int index) => ClipRRect(
                borderRadius:const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  padding:const EdgeInsets.symmetric(horizontal: 8),
                  width: MediaQuery.of(context).size.width/3,
                  height: 160,
                  decoration:const BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xff9661C3),Colors.deepPurpleAccent])
                  ),
                  child: forecastCard(snapshot,index),
                ),
            ),
        ),
    
      ),
    ],
  );
}