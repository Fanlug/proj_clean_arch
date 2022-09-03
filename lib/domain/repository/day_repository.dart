import '../models/day.dart';

abstract class DayRepository {
  Future<Day> geDay({
    required double latitude, required double longitude
  });
}
