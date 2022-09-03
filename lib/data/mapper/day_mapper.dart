
import '../../domain/model/day.dart';
import '../api/api_day.dart';

class DayMapper{
  static Day fromApi(ApiDay day){
    return Day(
      sunrise: day.sunrise,
      sunset: day.sunset,
      solarNoon: day.solarNoon,
      dayLength: day.dayLength,
    );
  }
}