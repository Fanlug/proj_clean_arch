
import 'package:proj_clean_arch/data/api/api_util.dart';
import 'package:proj_clean_arch/data/api/service/sunrise_service.dart';

class ApiModule {
  static final ApiUtil _apiUtil= ApiUtil(SunriseService());
  static ApiUtil apiUtil()  {
      return _apiUtil;
  }
}