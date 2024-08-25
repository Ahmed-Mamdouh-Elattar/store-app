import 'dart:developer';

import 'package:dio/dio.dart';

class Api {
  final dio = Dio();

  Future getWithQuery(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      log(e.toString());
    }
  }
}
