import 'package:dio/dio.dart';
import '../helpers/constants.dart';
import '../helpers/functions/system_log.dart';

final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.rawg.io/api/',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30)));

Future<Response> getConnect(
    {required String endpoint,
    String page = "1",
    required String platform,
    String pageSize = "20",
    required String ordering,
    required String searchQuery}) async {
  try {
    return await dio.get(endpoint, queryParameters: {
      'page': page,
      "key": Params.apiKey,
      "page_size": pageSize,
      "platforms": platform,
      "ordering": ordering,
      "search": searchQuery,
    });
  } on DioError catch (e) {
    systemLog(e.toString());
    rethrow;
  }
}

Future<Response> postConnect(url, data) async {
  try {
    dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    return await dio.post(url, data: data);
  } on DioError catch (e) {
    systemLog(e.toString());
    rethrow;
  }
}
