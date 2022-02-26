import 'package:dio/dio.dart';

final options = BaseOptions(baseUrl: 'https://swapi.dev/api/');

class ServerFailure implements Exception {}

class ClientFailure implements Exception {}

class DioClient {
  DioClient({Dio? dio}) : _dio = dio ?? Dio(options);

  final Dio _dio;

  Future<Response<Map<String, dynamic>?>> fetch(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>?>(
        uri,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
        throw ClientFailure();
      }
      throw ServerFailure();
    }
  }

  Future<List<Response<Map<String, dynamic>?>>> multipleFetch(
    List<String> uris, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await Future.wait(
        uris.map((u) => _dio.get<Map<String, dynamic>?>(u)).toList(),
      );
      return response;
    } on DioError catch (e) {
      if (e.response!.statusCode! >= 400 && e.response!.statusCode! < 500) {
        throw ClientFailure();
      }
      throw ServerFailure();
    }
  }
}
