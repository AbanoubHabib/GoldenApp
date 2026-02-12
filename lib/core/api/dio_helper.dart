import 'package:dio/dio.dart';

import 'api_constants.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        // if server return error like 404 or 500 ?
        // return data with error
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Accept': 'application/json',
          "User-Agent":
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
        },
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
