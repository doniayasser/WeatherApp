import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService
{
  Future<WeatherModel?> getWeather(String city) async
  {
    WeatherModel? weather;
    try
    {
      String baseUrl="http://api.weatherapi.com/v1";
      String apiKey="d05539bf41654e27b38101205230807";
      Uri url=Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$city&days=7");
      http.Response responseData= await http.get(url);
      Map<String,dynamic>data= jsonDecode(responseData.body);
      weather=WeatherModel.fromJson(data);
    }catch(error)
    {
      print("Error in weather service${error.toString()}");
    }

    return weather;
  }

}