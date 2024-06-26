part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocState {}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoadingState extends WeatherBlocState {}

final class WeatherBlocErrorState extends WeatherBlocState {}

final class WeatherBlocSuccessState extends WeatherBlocState {
  final Weather weather;

  WeatherBlocSuccessState({required this.weather});
}
