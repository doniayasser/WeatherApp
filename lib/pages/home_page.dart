import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../models/weather_model.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherInfo;
  void updateUi()
  {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    weatherInfo = Provider.of<WeatherProvider>(context).getWeatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context){
                      return SearchScreen();
                }),
                );},
              icon: const Icon(Icons.search_outlined),
          )
        ],

      ),

      body: weatherInfo == null ?
      const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'There is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ) :
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherInfo!.getThemeColor(),
              weatherInfo!.getThemeColor()[300]!,
              weatherInfo!.getThemeColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

          )

        ),

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 3,),
              Text(
                 Provider.of<WeatherProvider>(context).cityName!.toUpperCase(),
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0,),
              Text(
                "Updated at: ${weatherInfo!.date.hour}:${weatherInfo!.date.minute}",
                style: const TextStyle(
                  fontSize: 18.0,

                ),
              ),
              const Spacer(flex: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                      weatherInfo!.icon,
                  ),
                  Text(
                      "${weatherInfo!.avgTemp.toInt()}",
                    style: const TextStyle(fontSize: 30.0),
                  ),

                  Column(children: [
                    Text(
                      "Max: ${weatherInfo!.maxTemp.toInt()}",
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    Text(
                      "Min: ${weatherInfo!.minTemp.toInt()}",
                      style: const TextStyle(fontSize: 15.0),
                    ),
                  ],)
                ],
              ),
              const Spacer(flex: 1,),
              Text(
                weatherInfo!.weatherState,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(flex: 5,)

            ],
            ),
      ),

      );
  }
}
