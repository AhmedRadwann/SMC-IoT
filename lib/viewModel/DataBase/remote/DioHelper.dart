import 'package:dio/dio.dart';
import 'package:smc_iot/viewModel/DataBase/remote/Endpoints.dart';

class DioHelper{
  static Dio? dio;
  static init(){
    dio =Dio(
      BaseOptions(
        baseUrl: BaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String,dynamic>? query,
    String lang='en',
    String? Token,
})async{
    dio!.options.headers={
      'Content-Type':'application/json',
        'lang':lang,
        'Authorization':Token,

      };
   return await dio!.get(url, queryParameters: query);
  }

  static Future<Response?> postData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang='en',
    String? Token,
})async{
    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':Token,

    };
    return await dio!.post(url,data: data,queryParameters: query);
  }


}

