
import 'package:proj_clean_arch/data/api/api_util.dart';
import 'package:proj_clean_arch/data/api/service/sunrise_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;
  static ApiUtil? apiUtil()  {
      _apiUtil ??= ApiUtil(SunriseService());
      return _apiUtil;
  }
}