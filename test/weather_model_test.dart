import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather_model.dart';

void main() {
  group('Weather.fromJson Tests', () {
    test('parses valid JSON correctly', () {
      final json = {
        'name': 'Paris',
        'main': {'temp': 20.5, 'humidity': 50},
        'weather': [
          {'main': 'Clear'}
        ],
        'wind': {'speed': 3.5}
      };

      final weather = Weather.fromJson(json);

      expect(weather.cityName, 'Paris');
      expect(weather.temperature, 20.5);
      expect(weather.maincondn, 'Clear');
      expect(weather.humidity, 50);
      expect(weather.windSpeed, 3.5);
    });

    test('handles missing fields gracefully', () {
      final json = {
        'main': {'temp': 20.5},
      };

      expect(() => Weather.fromJson(json), throwsException);
    });

    test('throws an exception for invalid field types', () {
  final json = {
    'name': 123,
    'main': {'temp': 'hot', 'humidity': 'high'},
    'weather': [
      {'main': 456}
    ],
    'wind': {'speed': 'fast'}
  };

  expect(() => Weather.fromJson(json), throwsException);
});
  });
}
