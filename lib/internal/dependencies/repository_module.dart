
import 'package:proj_clean_arch/data/repository/day_data_repository.dart';
import 'package:proj_clean_arch/domain/repository/day_repository.dart';
import 'package:proj_clean_arch/internal/dependencies/api_module.dart';

class RepositoryModule{
  static final DayRepository _dayRepository = DayDataRepository(ApiModule.apiUtil());

  static DayRepository dayRepository(){
    return _dayRepository;
  }
}