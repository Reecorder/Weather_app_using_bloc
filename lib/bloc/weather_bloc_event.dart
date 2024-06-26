part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocEvent {}

class FetchWeather extends WeatherBlocEvent {
  final Position position;
  FetchWeather(this.position);
}
