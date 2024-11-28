// Mocks generated by Mockito 5.4.4 from annotations
// in weather_app/test/weather_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;
import 'package:weather_app/models/weather_model.dart' as _i2;
import 'package:weather_app/service/weather_service.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWeather_0 extends _i1.SmartFake implements _i2.Weather {
  _FakeWeather_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherService].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherService extends _i1.Mock implements _i3.WeatherService {
  MockWeatherService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get apiKey => (super.noSuchMethod(
        Invocation.getter(#apiKey),
        returnValue: _i4.dummyValue<String>(
          this,
          Invocation.getter(#apiKey),
        ),
      ) as String);

  @override
  _i5.Future<_i2.Weather> getWeather(String? cityName) => (super.noSuchMethod(
        Invocation.method(
          #getWeather,
          [cityName],
        ),
        returnValue: _i5.Future<_i2.Weather>.value(_FakeWeather_0(
          this,
          Invocation.method(
            #getWeather,
            [cityName],
          ),
        )),
      ) as _i5.Future<_i2.Weather>);

  @override
  _i5.Future<String> getCurrentCity() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentCity,
          [],
        ),
        returnValue: _i5.Future<String>.value(_i4.dummyValue<String>(
          this,
          Invocation.method(
            #getCurrentCity,
            [],
          ),
        )),
      ) as _i5.Future<String>);
}