import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  final String apiKey;

  DioClient({required this.baseUrl, required this.apiKey});

  Dio get dio => _getDio();

  Dio _getDio() {
    Map<String, dynamic> headers = {};
    headers['X-ListenAPI-Key'] = apiKey;
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 50000,
        receiveTimeout: 30000,
        headers: headers);

    Dio dio = Dio(options);
    dio.interceptors.add(DioLoggingInterceptor(level: Level.body, compact: false));

    return dio;
  }
}
