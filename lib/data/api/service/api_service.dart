import 'package:dio/dio.dart';
import 'package:zippy/data/api/api_top_up.dart';
import 'package:zippy/data/api/request/get_top_up_body.dart.dart';

class ApiService {

  final Dio _dio = Dio();

  Future<ApiTopUp> getTopUp(GetTopUpBody body) async {
    final response = await _dio.post(
      'https://payin-75jkb5hnza-uc.a.run.app/',
      queryParameters: body.toApi(),
    );
    return ApiTopUp.fromApi(response.data);
  }
}