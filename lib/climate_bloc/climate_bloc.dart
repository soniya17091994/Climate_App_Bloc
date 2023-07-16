import 'dart:convert';

import 'package:climate_bloc/climate_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'climate_event.dart';
import 'climate_state.dart';

class ClimateBloc extends Bloc<ClimateEvent, ClimateState> {
  ClimateBloc() : super(InitialClimateState()) {
    on<GetClimate>(_getClimate);
  }

  Future<void> _getClimate(GetClimate event, Emitter<ClimateState> emit) async {
    emit(ClimateLoadingState());
    ClimateRepository climateRepository = ClimateRepository();
    final climateResponse =
        await climateRepository.getClimate(city: event.cityName);
    if (climateResponse.statusCode == 200) {
      final climateResponseJson = climateResponse.body;
      final decodedJson = jsonDecode(climateResponseJson);
      final temp = decodedJson['main']['temp'];
      emit(ClimateLoadedState(
          event.cityName, (temp - 273).toString().split('.')[0]));
    } else {
      emit(ClimateErrorState());
    }
  }
}
