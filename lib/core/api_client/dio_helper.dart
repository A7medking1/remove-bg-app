import 'package:dio/dio.dart';
import 'package:removebackground/api_constant.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        responseType: ResponseType.bytes,
      ),
    );
  }

  // ****************************************************

  static Future<Response<dynamic>> postData({
    required String url,
    Map<String, dynamic>? query,
   // required Map<String, dynamic> data,
    required dynamic data ,
  }) async {
    dio.options.headers = {
      'API-KEY': ApiConstant.token,
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}