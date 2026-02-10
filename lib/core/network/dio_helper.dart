import 'package:dio/dio.dart';
import 'package:goldenprice/core/network/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        // if server return error like 404 or 500 ? return data with error
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
   // String? token,
  }) async {
    return await dio.get(endPoint, queryParameters: queryParameters);
  }
}
