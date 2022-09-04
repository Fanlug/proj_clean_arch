import 'package:dio/dio.dart';
import 'package:proj_clean_arch/data/api/request/get_day_body.dart';
import '../api_day.dart';

class SunriseService {
  static const _baseUrl = "https://api.sunrise-sunset.org";
  final Dio _dio = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );

  Future<ApiDay> getDay(GetDayBody body)
  async {
    final response =await _dio.get(
      '/json',
      queryParameters: body.toApi(),
    );
    return ApiDay.fromApi(response.data);
  }
}
