import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/response.dart';
import 'http_service.dart';
import 'shared_prefs.dart';

//TODO: Add PUT, PATCH, DELETE Requests
//TODO: Handle Errors Very Very Nicely. Still Exception are not catched properly.
//! Try making request without auth-token and see logs and Dart Network Inspector
final baseUrl = dotenv.env['SERVER_ADDRESS']! + dotenv.env['PORT']!;

class HttpImplementation implements HttpService {
  late Dio _dio;

  String? authToken;

  @override
  void init() async {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
    ));
    getToken();
    initializeInterceptors();
  }

  getToken() async {
    authToken = await SharedPreference.getAuthState();
  }

  //GET Request
  @override
  Future<ResponseModel> getRequest(String url,
      {Map<String, dynamic>? data}) async {
    try {
      late Response response;
      if (authToken != null) _dio.options.headers = {'auth-token': authToken};
      response = await _dio.get(url, queryParameters: data);
      return ResponseModel.fromJson(response.data);
    } on Exception catch (e) {
      print('$e');
      return ResponseModel(
          message: 'Error connecting to the Host.', state: false);
    }
  }

  //POST REQUEST
  ///`data` can be either `Map` or a `Dio.FormData`.
  @override
  Future<ResponseModel> postRequest(String url, {data}) async {
    try {
      late Response response;
      if (authToken != null) _dio.options.headers = {'auth-token': authToken};
      response = await _dio.post(url, data: data);
      return ResponseModel.fromJson(response.data);
    } on Exception catch (e) {
      print('$e');
      return ResponseModel(
          message: 'Error connecting to the Host.', state: false);
    }
  }

  //These intercepts intercepts all of our requests, responses and error
  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (req, handler) {
          print(
              "${req.method} | ${req.baseUrl} | ${req.path} | ${req.data}| ${req.headers}");
          return handler.next(req); //continue
        },
        onResponse: (res, handler) {
          print("${res.statusCode} | ${res.statusMessage}");
          return handler.next(res); // continue
        },
        // Error Handling
        onError: (DioError e, handler) {
          Response<dynamic>? result = e.response;
          //Could Not connect to server

          //Connected to Server but did not received expected response. 2xx error
          if (result != null) {
            print(result.data);
            print(result.headers);
            print(result.statusCode);
            print(result.statusMessage);
          }
          //Could Not connect to server
          else {
            print(e.message);
          }

          return handler.next(e); //continue
        },
      ),
    );
  }
}
