
import '../../domain/model/day.dart';
import '../api/api_day.dart';

class DayMapper{
  static Day fromApi(ApiDay day){
    return Day(
      sunrise: DateTime.parse(day.sunrise),
      sunset: DateTime.parse(day.sunset),
      solarNoon: DateTime.parse(day.solarNoon),
      dayLength: day.dayLength.toInt(),
    );
  }
}