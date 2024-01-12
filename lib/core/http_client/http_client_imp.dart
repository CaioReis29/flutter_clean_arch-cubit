import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/http_client/http_client.dart';

class HttpClientImp implements HttpClient {
  final Dio _dio = Dio();
  @override
  Future<HttpResponse> get(String url) async {
    final response = await _dio.get(url);
    return HttpResponse(
      statusCode: response.statusCode!,
      data: response.data,
    );
  }
}
