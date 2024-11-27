// class Weather {
//   final String cityName;
//   final double temperature;
//   final String maincondn;
//   final int humidity; // Percentage
//   final double windSpeed; // in meters per second

//   Weather({
//     required this.cityName,
//     required this.temperature,
//     required this.maincondn,
//     required this.humidity,
//     required this.windSpeed,
//   });

//   factory Weather.fromJson(Map<String, dynamic>? json) {
//     if (json == null) {
//       return Weather(
//         cityName: '',
//         temperature: 0.0,
//         maincondn: '',
//         humidity: 0,
//         windSpeed: 0.0,
//       );
//     }

//     return Weather(
//       cityName: json['name'] ?? '',
//       temperature: json['main'] != null && json['main']['temp'] is num
//           ? (json['main']['temp'] as num).toDouble()
//           : 0.0,
//       maincondn: json['weather'] != null &&
//               json['weather'] is List &&
//               json['weather'].isNotEmpty
//           ? json['weather'][0]['main'] ?? ''
//           : '',
//       // time: parsedTime,
//       humidity: json['main'] != null && json['main']['humidity'] is int
//           ? json['main']['humidity']
//           : 0,
//       windSpeed: json['wind'] != null && json['wind']['speed'] is num
//           ? (json['wind']['speed'] as num).toDouble()
//           : 0.0,
//     );
//   }
// }
class Weather {
  final String cityName;
  final double temperature;
  final String maincondn;
  final int humidity; // Percentage
  final double windSpeed; // in meters per second

  Weather({
    required this.cityName,
    required this.temperature,
    required this.maincondn,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw Exception('JSON data is null');
    }

    // Validate and extract fields
    final cityName = json['name'];
    if (cityName == null || cityName is! String) {
      throw Exception('Invalid or missing field: name');
    }

    final main = json['main'];
    if (main == null || main['temp'] == null || main['temp'] is! num) {
      throw Exception('Invalid or missing field: main.temp');
    }

    final weatherList = json['weather'];
    final mainCondition = (weatherList is List && weatherList.isNotEmpty)
        ? weatherList[0]['main']
        : null;
    if (mainCondition == null || mainCondition is! String) {
      throw Exception('Invalid or missing field: weather[0].main');
    }

    final humidity = main['humidity'];
    if (humidity == null || humidity is! int) {
      throw Exception('Invalid or missing field: main.humidity');
    }

    final wind = json['wind'];
    final windSpeed =
        (wind != null && wind['speed'] != null && wind['speed'] is num)
            ? wind['speed']
            : null;
    if (windSpeed == null) {
      throw Exception('Invalid or missing field: wind.speed');
    }

    return Weather(
      cityName: cityName,
      temperature: (main['temp'] as num).toDouble(),
      maincondn: mainCondition,
      humidity: humidity,
      windSpeed: (windSpeed as num).toDouble(),
    );
  }
}
