
import 'package:proj_clean_arch/data/repository/day_data_repository.dart';
import 'package:proj_clean_arch/domain/repository/day_repository.dart';
import 'package:proj_clean_arch/internal/dependencies/api_module.dart';

class RepositoryModule{
  static DayRepository? _dayRepository;

  static DayRepository? dayRepository(){
    _dayRepository ??= DayDataRepository(ApiModule.apiUtil());
    return _dayRepository;
  }
}