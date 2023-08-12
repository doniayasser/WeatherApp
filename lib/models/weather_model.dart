import 'package:flutter/material.dart';

class WeatherModel
{
  DateTime date;
  double avgTemp;
  double minTemp;
  double maxTemp;
  String weatherState;
  var icon;
  WeatherModel({required this.date,required this.avgTemp,required this.minTemp,required this.maxTemp,required this.weatherState,required this.icon});

  factory WeatherModel.fromJson(dynamic data)
  {
    var tempsJsonPath=data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        date: DateTime.parse(data["location"]["localtime"]),
        avgTemp: tempsJsonPath["avgtemp_c"],
        maxTemp: tempsJsonPath["maxtemp_c"],
        minTemp: tempsJsonPath["mintemp_c"],
        weatherState: tempsJsonPath["condition"]["text"],
        icon: tempsJsonPath["condition"]["icon"]
    );


  }

  MaterialColor getThemeColor()
  {
    if(weatherState=="Clear" || weatherState=="Light cloud" || weatherState=="Patchy rain possible" ) {
      return Colors.cyan;
    } else if(weatherState=="Sleet" || weatherState=="Snow" || weatherState=="Hail" )
      return Colors.blue;
    else if(weatherState=="Heavy cloud")
      return Colors.blueGrey;
    else if(weatherState=="Light Rain" || weatherState=="Heavy Rain" || weatherState=="Showers")
      return Colors.indigo;
    else if(weatherState=="Thunderstorm")
      return Colors.deepPurple;
    else
      return Colors.amber;

  }


}


