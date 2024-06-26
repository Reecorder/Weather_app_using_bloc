import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_bloc/repo/weather_data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>(fetchWeather);
  }

  FutureOr<void> fetchWeather(
      FetchWeather event, Emitter<WeatherBlocState> emit) async {
    emit(WeatherBlocLoadingState());
    try {
      // Weather factory from weather package
      WeatherFactory wf =
          WeatherFactory(weatherApikey, language: Language.ENGLISH);

      // weather
      Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude, event.position.longitude);

      log(weather.toString());

      emit(WeatherBlocSuccessState(weather: weather));
    } catch (e) {
      log(e.toString());
      emit(WeatherBlocErrorState());
    }
  }
}
