import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../main.dart';
import 'package:lottie/lottie.dart';
import '../theme/theme.dart';
import '../models/weather_model.dart';

import '../service/weather_service.dart';
import '../models/fav_model.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatefulWidget {
  final String? cityName;
  const WeatherPage({Key? key, this.cityName}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final _weatherService = WeatherService('YOUR_API_KEY');
  Weather? _weather;
  late String cityName;

  @override
  void initState() {
    super.initState();
    if (widget.cityName != null && widget.cityName!.isNotEmpty) {
      cityName = widget.cityName!;
      _fetchWeather(widget.cityName!);
    } else {
      _fetchCurrentLocation();
    }
  }

  Future<void> _fetchWeather(String cityName) async {
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _fetchCurrentLocation() async {
    try {
      final currentCity = await _weatherService.getCurrentCity();
      final weather = await _weatherService.getWeather(currentCity);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print("Error fetching current location: $e");
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/cloudy.json';
      case 'mist':
        return 'assets/mist.json';
      case 'smoke':
        return 'assets/smoke.json';
      case 'haze':
        return 'assets/haze.json';
      case 'dust':
        return 'assets/dust.json';
      case 'fog':
        return 'assets/fog.json';
      case 'rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'snow':
        return 'assets/snow.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[200],
        actions: [
          Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return IconButton(
                icon: Icon(
                    themeModel.isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
                onPressed: () {
                  themeModel.toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      body: _weather == null
          ? Center(
              child: CircularProgressIndicator(color: Colors.blueGrey[200]))
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                _weather?.cityName ?? 'Loading city...',
                                style: TextStyle(fontSize: 20),
                              ),
                              Consumer<FavouriteModel>(
                                builder: (context, favouriteModel, child) {
                                  bool isFavourite = favouriteModel
                                      .isFavourite(_weather?.cityName ?? '');
                                  return IconButton(
                                    icon: Icon(
                                      isFavourite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavourite
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      if (isFavourite) {
                                        favouriteModel.removeFromFavourites(
                                            _weather?.cityName ?? '');
                                      } else {
                                        favouriteModel.addToFavourites(
                                            _weather?.cityName ?? '');
                                      }
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Lottie.asset(
                              getWeatherAnimation(_weather?.maincondn),
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_weather?.temperature.round()}°C',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  _weather?.maincondn ?? "",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Humidity: ${_weather?.humidity ?? ''}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  'Wind: ${_weather?.windSpeed ?? ''} m/s',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
