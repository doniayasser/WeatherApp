import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier
{
  WeatherModel? _weatherProviderData;
  String? cityName;
  set weatherProviderData(WeatherModel? weather)
  {
    _weatherProviderData=weather;
    notifyListeners();

  }
  WeatherModel? get getWeatherData
  {
    return _weatherProviderData;
  }
}