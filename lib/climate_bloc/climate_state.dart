class ClimateState {
  final String cityName;
  final String temperature;
  ClimateState(this.cityName, this.temperature);
}

class InitialClimateState extends ClimateState {
  InitialClimateState() : super('', '0.0');
}

class ClimateLoadingState extends ClimateState {
  ClimateLoadingState() : super('', '0.0');
}

class ClimateLoadedState extends ClimateState {
  ClimateLoadedState(String cityName, String temperature)
      : super(cityName, temperature);
}

class ClimateErrorState extends ClimateState {
  ClimateErrorState() : super('', '0.0');
}
