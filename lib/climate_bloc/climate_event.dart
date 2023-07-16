abstract class ClimateEvent {}

class GetClimate extends ClimateEvent {
  final String cityName;
  GetClimate(this.cityName);
}
