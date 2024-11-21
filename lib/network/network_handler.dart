import 'package:base/network/app_end_points.dart';
import 'package:dio/dio.dart';

/// This class is used to handle network requests.
class NetworkHandler {
  Dio dio = Dio();
  static NetworkHandler instance = NetworkHandler._internal();

  NetworkHandler._internal() {
    dio.options.baseUrl = AppEndPoints.baseUrl;
    dio.options.headers = {
      "Accept": "application/json",
    };
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return await dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      return await dio.post(
        url,
        queryParameters: queryParameters,
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }
}
