import 'package:mobx/mobx.dart';

import '../model/day.dart';
import '../repository/day_repository.dart';

part 'home_state.g.dart';

class HomePageState = HomePageStateBase with _$HomePageState;

abstract class HomePageStateBase with Store {

  HomePageStateBase(this._dayRepository);
  final DayRepository _dayRepository;

  @observable
  Day? day;

  @observable
  bool isLoading = false;

  @action
  Future<void> getDay(
      {required double latitude, required double longitude}) async {
    isLoading = true;
    final data = await _dayRepository.getDay(latitude: latitude, longitude: longitude);
    day = data;
    isLoading = false;
  }
}
