import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatefulWidget {
   const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a city"
        ),
      ),
      body: Center(
        child: Padding(

          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            keyboardType: TextInputType.name,
            autofocus: true,
            validator: (value){
              if(value!.isEmpty)
                {
                  setState(() {});
                  return "Invalid City Name";
                }
              return null;

            },
            onChanged: (data){cityName=data;},
            onFieldSubmitted: (data) async{
              cityName=data;
              WeatherService c=WeatherService();
              WeatherModel? weatherData=await c.getWeather(cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherProviderData=weatherData ;
              Provider.of<WeatherProvider>(context,listen: false).cityName=cityName ;
              Navigator.pop(context);
              },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 35.0,horizontal: 20.0),
              border: const OutlineInputBorder(),
              hintText: "Enter a city",
              suffixIcon: IconButton(
                onPressed: () async{
                    // cityName=dataOnIcon;
                    WeatherService c=WeatherService();
                    WeatherModel? weatherData=await c.getWeather(cityName!);
                    Provider.of<WeatherProvider>(context,listen: false).weatherProviderData=weatherData ;
                    Provider.of<WeatherProvider>(context,listen: false).cityName=cityName ;
                    Navigator.pop(context);

                  },
                icon: Icon(Icons.search),),
              label: const Text("Search"),
              ),

            ),
          ),
        ),
    );
  }
}